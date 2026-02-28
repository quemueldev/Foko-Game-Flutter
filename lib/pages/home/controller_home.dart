

import 'package:app/widgets/cards/main_card/controller_main_card.dart';
import 'package:flutter/material.dart';

class HomeController {
  bool _showDialog = false;

  void resetDialog(){
    _showDialog = false;
  }

  void checkGameEnd(
    GameController controller1,
    GameController controller2,
    context
    ){
    if (
      controller1.remainingSeconds == 0 
      && controller1.hasStarted
      &&!_showDialog
    ) {
      _showDialog = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Fim de jogo", style: TextStyle(fontSize: 25)),
            content: Text(_getResult(controller1, controller2), style: TextStyle(fontSize: 20)),
          ),
        );
      });
    }
  }
  String _getResult(GameController player1, GameController player2){
    if (player1.score > player2.score) return "Vermelho venceu!";
    if (player2.score > player1.score) return "Azul venceu!";
    return "Empate!";
  }
}