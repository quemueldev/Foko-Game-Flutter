import 'package:app/widgets/scroll/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/lobby.dart';
import 'package:flutter/services.dart';


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Karantina',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),
      scrollBehavior: MyScrollBehavior(),
      home: Lobby()
    );
  }
}