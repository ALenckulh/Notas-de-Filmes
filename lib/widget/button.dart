import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double border;
  final Color? bg;
  final IconData? icon;
  final VoidCallback onPressed;
  final String text;

  const Button(
      {this.border = 0,
        this.bg = Colors.indigo,
        this.icon = Icons.plus_one,
        required this.onPressed,
        required this.text,
        super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border), // Raio dos cantos
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(bg),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(text)
          ],
        ));
  }
}