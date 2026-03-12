import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class GlassChip extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool active;

  const GlassChip({
    super.key,
    required this.text,
    this.icon,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}