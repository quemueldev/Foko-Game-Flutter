import 'package:app/pages/home/home.dart';
import 'package:app/widgets/buttons/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  void entrar (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHome()
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.02),
                  Text(
                    'Reflex Versus Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40
                    )
                  ),
                  SizedBox(height: height * 0.04),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child:Image.asset(
                      'assets/logo.png',
                      width: 170,
                      height: 170,
                      fit: BoxFit.cover, 
                    ), 
                  ),
                  SizedBox(height: height * 0.1),
                  Row(
                    children: [
                      MyNavigateButton(
                        onPressed:entrar,
                        child: Text('Play', style: TextStyle(color: Colors.white, fontSize: 35)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}