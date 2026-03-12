import 'package:app/pages/home/controller_home.dart';
import 'package:app/widgets/buttons/start_button.dart';
import 'package:app/widgets/cards/main_card/controller_main_card.dart';
import 'package:app/widgets/cards/main_card/main_card.dart';
import 'package:app/widgets/cards/timer_card/timer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late GameController controller1;
  late GameController controller2;
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    controller1 = GameController();
    controller2 = GameController();
    homeController = HomeController();
    controller1.addListener((){
      homeController.checkGameEnd(
        controller1, 
        controller2, 
        context
      );
    });
  }
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
  // add: quando clicar dnv reiniciar
  void _startGame(){
    homeController.resetDialog();
    controller1.start();
    controller2.start();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Color(0xFF141414),
      body: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
          child: Column(
            children: [
              MyMainCard(controller: controller1, inverted: true, color: Color(0xFF361c1d),),
            
              AnimatedBuilder(
                animation: controller1,
                builder: (_, _) {
          
                  homeController.checkGameEnd(
                    controller1,
                    controller2,
                    context,
                  );
                  
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      MyStartButton(
                        onPressed: () {
                          if (controller1.isStart){
                            controller1.stopGameAction();
                            controller2.stopGameAction();
                          } else {_startGame();}
                        },
                        isStop: controller1.isStart,
                      ),
                      const SizedBox(width: 50),
                      MyTimerCard(title:"00 : ${controller1.remainingSeconds.toString().padLeft(2, '0')}")
                    ],
                  );
                },
              ),
              MyMainCard(controller: controller2, inverted: false, color: Color(0xFF112b48),),
            ],
          ),
        ),
      ),
    );
  }
}
