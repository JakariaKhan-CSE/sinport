import 'package:flutter/material.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/primary_action_button.dart';
import '../../../home/presentation/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _WelcomeBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'WELCOME',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'SINGAPOUR\nCHANGI\nAIRPORT',
                    style: TextStyle(
                      height: 0.95,
                      color: Colors.white,
                      fontSize: 54,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'We are here to help you interact with all airport\ncomplexes and save your time',
                    style: TextStyle(
                      color: AppColors.softWhite,
                      fontSize: 18,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 26),
                  PrimaryActionButton(
                    text: 'Discover the airport',
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        HomePage.routeName,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeBackground extends StatelessWidget {
  const _WelcomeBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1F6F8F),
            Color(0xFF0B1D30),
            Color(0xFF0D111A),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(.15),
            ),
          ),
          Positioned(
            top: 80,
            left: -20,
            right: -20,
            child: Transform.rotate(
              angle: -0.25,
              child: Icon(
                Icons.flight_rounded,
                size: 340,
                color: Colors.white.withOpacity(.18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}