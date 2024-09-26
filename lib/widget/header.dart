import 'package:flutter/material.dart';
import 'package:notas/themes/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MyColors.neutral,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 12,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.note_alt,
              size: 28,
              color: MyColors.primary50,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Take Your Note",
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: MyColors.primary,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
