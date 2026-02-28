import 'dart:math';

class GameEngine {
  final int gridSize;
  final Random _random = Random();

  int? _currentIndex;
  int? _lastIndex;

  int score = 0;

  GameEngine({this.gridSize = 6});

  int generateNextIndex() {
    int index;
    do {
      index = _random.nextInt(gridSize);
    } while (index == _lastIndex);
    
    _lastIndex = index;
    _currentIndex = index;
    return index;
  }

  void handleTap(int index) {
    if (_currentIndex == null) return;

    if (index == _currentIndex) {
      score++;
    } else {
      score > 0 ? score-- : null; 
    }
  }

  int? get currentIndex => _currentIndex;
}
