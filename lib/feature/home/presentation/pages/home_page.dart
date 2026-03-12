import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/menu_item_model.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/app_bottom_nav_bar.dart';
import '../../../map/presentation/pages/map_page.dart';
import '../provider/home_provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    final menuItems = <MenuItemModel>[
      const MenuItemModel(
        title: 'Transfer',
        icon: Icons.local_taxi_rounded,
        color: AppColors.primary,
      ),
      const MenuItemModel(
        title: '',
        icon: Icons.bed_rounded,
        color: AppColors.white,
      ),
      const MenuItemModel(
        title: '',
        icon: Icons.luggage_rounded,
        color: AppColors.white,
      ),
      const MenuItemModel(
        title: 'Tickets',
        icon: Icons.confirmation_number_rounded,
        color: AppColors.red,
      ),
      const MenuItemModel(
        title: 'Car Rent',
        icon: Icons.directions_car_rounded,
        color: AppColors.green,
      ),
      const MenuItemModel(
        title: '',
        icon: Icons.forum_rounded,
        color: AppColors.white,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderSection(),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (_, index) {
                  final item = menuItems[index];
                  return _MenuCard(item: item);
                },
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  const Text(
                    'Upcoming departures',
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(
                            color: AppColors.softWhite,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_outward_rounded,
                          color: AppColors.primary,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 18),
              const Expanded(
                child: _DeparturesSection(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: provider.bottomIndex,
        onTap: (index) {
          provider.changeBottomIndex(index);
          if (index == 1) {
            Navigator.pushNamed(context, MapPage.routeName);
          }
        },
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good afternoon!',
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Airport map',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 2),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            Icons.arrow_outward_rounded,
            color: AppColors.primary,
            size: 34,
          ),
        ),
      ],
    );
  }
}

class _MenuCard extends StatelessWidget {
  final MenuItemModel item;

  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: item.title.isEmpty
          ? Center(
        child: Icon(
          item.icon,
          size: 42,
          color: Colors.black,
        ),
      )
          : Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: 36,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              item.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeparturesSection extends StatelessWidget {
  const _DeparturesSection();

  @override
  Widget build(BuildContext context) {
    final flights = [
      ('Singapore - San Francisco', '27 Aug 2022 13:22', 'Gate 1C'),
      ('Singapore - New York', '27 Aug 2022 14:11', 'Gate 2B'),
      ('Singapore - London', '27 Aug 2022 16:00', 'Gate 1A'),
    ];

    return ListView.separated(
      itemCount: flights.length,
      separatorBuilder: (_, __) => Divider(
        color: Colors.white.withOpacity(.10),
        height: 26,
      ),
      itemBuilder: (_, index) {
        final flight = flights[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flight.$1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    flight.$2,
                    style: const TextStyle(
                      color: AppColors.gray,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                flight.$3,
                style: const TextStyle(
                  color: AppColors.gray,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}