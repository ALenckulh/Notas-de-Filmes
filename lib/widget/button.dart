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
      this.icon,
      required this.onPressed,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(bg),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon),
              const SizedBox(width: 4),
            ],
            Text(text)
          ],
        ));
  }
}
