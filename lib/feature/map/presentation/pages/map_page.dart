import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/app_bottom_nav_bar.dart';
import '../../../../core/widget/floor_selector.dart';
import '../../../../core/widget/glass_chip.dart';
import '../../../../core/widget/map_background.dart';
import '../../../../core/widget/rounded_icon_button.dart';
import '../../../home/presentation/provider/home_provider.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../provider/map_provider.dart';

class MapPage extends StatelessWidget {
  static const String routeName = '/map';

  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: MapBackground(showRoute: mapProvider.showRoute),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 14),
                const _TopCategoryBar(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      FloorSelector(
                        selectedFloor: mapProvider.selectedFloor,
                        onSelected: mapProvider.selectFloor,
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
                _BottomPlaceCard(
                  isRoutePreview: mapProvider.showRoute,
                  onActionTap: () {
                    if (mapProvider.showRoute) {
                      Navigator.pushNamed(context, NavigationPage.routeName);
                    } else {
                      mapProvider.startRoute();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: homeProvider.bottomIndex,
        onTap: (index) => homeProvider.changeBottomIndex(index),
      ),
    );
  }
}

class _TopCategoryBar extends StatelessWidget {
  const _TopCategoryBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: const [
          GlassChip(
            text: '',
            icon: Icons.search_rounded,
            active: true,
          ),
          SizedBox(width: 10),
          GlassChip(text: 'Shopping', icon: Icons.shopping_bag_rounded),
          SizedBox(width: 10),
          GlassChip(text: 'Gates', icon: Icons.login_rounded),
          SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GlassChip(text: 'ATM', icon: Icons.credit_card_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPlaceCard extends StatelessWidget {
  final bool isRoutePreview;
  final VoidCallback onActionTap;

  const _BottomPlaceCard({
    required this.isRoutePreview,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 94),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gate 1C',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Airport infrastructure',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                ),
                Icon(Icons.close_rounded, color: Colors.black26),
              ],
            ),
          ),
          if (isRoutePreview)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: _WalkInfo(),
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  _MiniCircleIcon(icon: Icons.share_rounded),
                  SizedBox(width: 10),
                  _MiniCircleIcon(icon: Icons.bookmark_rounded),
                ],
              ),
            ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: onActionTap,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 18),
                  Expanded(
                    child: Text(
                      isRoutePreview ? "Let's go" : 'Build a route',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 18),
                    child: Icon(
                      Icons.arrow_outward_rounded,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _WalkInfo extends StatelessWidget {
  const _WalkInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.06),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.directions_walk_rounded, color: Colors.black54, size: 18),
          SizedBox(width: 6),
          Text(
            '15 min on foot  ·  1.1 km',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniCircleIcon extends StatelessWidget {
  final IconData icon;

  const _MiniCircleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.06),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black87, size: 18),
    );
  }
}