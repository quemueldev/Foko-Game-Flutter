import 'package:flutter/material.dart';

class MyStartButton extends StatefulWidget {
  final VoidCallback onPressed;

  const MyStartButton({super.key, required this.onPressed});

  @override
  State<MyStartButton> createState() => _MyStartButtonState();
}

class _MyStartButtonState extends State<MyStartButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 120,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
            ),
        ),
        child: Text(
          'START', 
          style: TextStyle(
            color: Colors.black,
            fontSize: 30
          ),
        ),
      ),
    );
  }
}