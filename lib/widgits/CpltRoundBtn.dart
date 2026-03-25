import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String? text;          // Optional text
  final IconData? icon;        // Optional icon
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CircularButton({
    super.key,
    this.text,
    this.icon,
    required this.backgroundColor,
    required this.onPressed,
  }) : assert(
  text != null || icon != null,
  'You must provide either text or icon',
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // constant circular size
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
        ),
        child: icon != null
            ? Icon(
          icon,
          color: Colors.white,
          size: 25,
        )
            : Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
