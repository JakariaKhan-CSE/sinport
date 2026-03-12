import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/floor_selector.dart';
import '../../../../core/widget/map_background.dart';
import '../../../../core/widget/rounded_icon_button.dart';
import '../../../map/presentation/provider/map_provider.dart';


class NavigationPage extends StatelessWidget {
  static const String routeName = '/navigation';

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MapProvider>();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: MapBackground(showRoute: true),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 16),
                        Icon(Icons.turn_left_rounded, color: Colors.black, size: 28),
                        SizedBox(width: 12),
                        Text(
                          '100 m turn left',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      FloorSelector(
                        selectedFloor: provider.selectedFloor,
                        onSelected: provider.selectFloor,
                      ),
                      const Spacer(),
                      Column(
                        children: const [
                          RoundedIconButton(icon: Icons.add_rounded),
                          SizedBox(height: 12),
                          RoundedIconButton(icon: Icons.remove_rounded),
                          SizedBox(height: 12),
                          RoundedIconButton(icon: Icons.settings_rounded),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  margin: const EdgeInsets.fromLTRB(18, 0, 18, 28),
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: _StatItem(
                              value: '10:00',
                              label: 'Arrival',
                            ),
                          ),
                          Expanded(
                            child: _StatItem(
                              value: '1 km',
                              label: 'Distance',
                            ),
                          ),
                          Expanded(
                            child: _StatItem(
                              value: '5 min',
                              label: 'On the way',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.cancelRoute();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.close_rounded,
                            color: Colors.black54,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}