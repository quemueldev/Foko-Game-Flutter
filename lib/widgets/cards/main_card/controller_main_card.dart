import 'dart:async';
import 'package:flutter/material.dart';
import 'engine_controller.dart';
import 'package:vibration/vibration.dart';


class GameController extends ChangeNotifier {
  final Duration interval;
  final int gridSize;
  final Duration gameDuration;

  late GameEngine engine;

  late List<bool> _activeStates;
  bool _isRunning = false;

  int _remainingSeconds = 0;
  int get remainingSeconds => _remainingSeconds;
  int? tapedId;
  bool hasStarted = false;
  bool _canTap = true;


  GameController({
    this.interval = const Duration(milliseconds: 450),
    this.gridSize = 6,
    this.gameDuration = const Duration(seconds: 30),
  }) {
    engine = GameEngine(gridSize: gridSize);
    _activeStates = List.filled(gridSize, false);
  }

  List<bool> get activeStates => List.unmodifiable(_activeStates);
  int get score => engine.score;
  
  

  Future<void> start() async {
    hasStarted = true;
    engine.score = 0;
    if (_isRunning) return;
    _isRunning = true;
    _remainingSeconds = gameDuration.inSeconds;
    notifyListeners();

    _runGameLoop();
    _runTimer();
  }
  Future<void> _runGameLoop() async {
    while (_isRunning) {
      final index = engine.generateNextIndex();
      _activate(index);
      await Future.delayed(interval);
    }
  }
  Future<void> _runTimer() async {
    while (_isRunning && _remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _remainingSeconds--;
      notifyListeners();
    }

    stop();
    await Vibration.vibrate(
      duration: 600,
      amplitude: 255,
    );
  }

  void stop() {
    _activeStates = List.filled(_activeStates.length, false);
    _isRunning = false;
  }

  void handleTap(int index) {
    if (_canTap){
      tapedId = index;
      engine.handleTap(index);
      _canTap = false;
      notifyListeners();
    }
  }

  void _activate(int index) {
    _activeStates = List.filled(_activeStates.length, false);
    _activeStates[index] = true;
    tapedId = null;
    _canTap = true;
    notifyListeners();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
