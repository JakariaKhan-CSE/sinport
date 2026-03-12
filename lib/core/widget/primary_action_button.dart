import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class PrimaryActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData trailingIcon;

  const PrimaryActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.trailingIcon = Icons.arrow_outward_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(trailingIcon, color: Colors.black, size: 28),
          ],
        ),
      ),
    );
  }
}