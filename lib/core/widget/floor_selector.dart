import 'package:flutter/material.dart';

import '../theme/app_color.dart';
class FloorSelector extends StatelessWidget {
  final int selectedFloor;
  final ValueChanged<int> onSelected;

  const FloorSelector({
    super.key,
    required this.selectedFloor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    const floors = [2, 1, -1];

    return Column(
      children: floors.map((floor) {
        final isSelected = selectedFloor == floor;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () => onSelected(floor),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.white
                    : AppColors.white.withOpacity(.28),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  '$floor',
                  style: TextStyle(
                    color: isSelected ? Colors.black : AppColors.softWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}