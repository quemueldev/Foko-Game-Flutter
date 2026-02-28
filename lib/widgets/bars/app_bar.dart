import 'package:flutter/material.dart';

class MyMainBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const MyMainBar({super.key,required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 12,
      backgroundColor: Colors.redAccent,
      
    );
  }
}