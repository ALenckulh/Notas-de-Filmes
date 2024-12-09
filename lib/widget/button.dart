import 'package:flutter/material.dart';
import 'package:notas/themes/colors.dart';

enum ButtonType { fill, outline, ghost }

enum ButtonState { primary, danger }

class Button extends StatelessWidget {
  final double border;
  final ButtonType type;
  final ButtonState state;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String text;

  const Button({
    this.border = 0,
    this.type = ButtonType.fill,
    this.state = ButtonState.primary,
    this.icon,
    required this.onPressed,
    required this.text,
    super.key,
  });

  EstiloBotao(ButtonType type, ButtonState state) {
    switch (state) {
      case ButtonState.primary:
        switch (type) {
          case ButtonType.fill:
            return ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(MyColors.primary),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                ),
              ),
            );
          case ButtonType.outline:
            return ButtonStyle(
              side: const WidgetStatePropertyAll(
                  BorderSide(color: MyColors.primary, width: 2)),
              foregroundColor: const WidgetStatePropertyAll(MyColors.primary),
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                ),
              ),
            );
          case ButtonType.ghost:
            return ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(MyColors.primary),
              backgroundColor:
                  WidgetStatePropertyAll(MyColors.primary.withOpacity(0.1)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                ),
              ),
            );
        }
      case ButtonState.danger:
        switch (type) {
          case ButtonType.fill:
            return ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(MyColors.primary),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                ),
              ),
            );
          case ButtonType.outline:
            return ButtonStyle(
              side: const WidgetStatePropertyAll(
                  BorderSide(color: MyColors.primary, width: 2)),
              foregroundColor: const WidgetStatePropertyAll(MyColors.primary),
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                ),
              ),
            );
          case ButtonType.ghost:
            return ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(MyColors.primary),
              backgroundColor:
                  WidgetStatePropertyAll(MyColors.primary.withOpacity(0.1)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                ),
              ),
            );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
