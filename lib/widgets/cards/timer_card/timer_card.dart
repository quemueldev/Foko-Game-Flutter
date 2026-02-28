import 'package:flutter/material.dart';

class MyTimerCard extends StatelessWidget {
  final String title;
  const MyTimerCard({
    super.key, required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 120,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF383838),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white,
            width: 0.5
          )
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            )
          )
        )
      ),
    );
  }
}