import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final double size;

  const RoundedIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = AppColors.white,
    this.iconColor = Colors.black,
    this.onTap,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size / 2.2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 16,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}