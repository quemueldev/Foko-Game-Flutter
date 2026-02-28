import 'package:flutter/material.dart';

class MyNavigateButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  const MyNavigateButton({super.key, this.child, this.onPressed});

  @override
  State<MyNavigateButton> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<MyNavigateButton> {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 177, 28, 18),
            minimumSize: Size(0, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          child: widget.child
        
        ),
      ),
    );
  }
}