import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'onboarding/onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    // Navigate after splash
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGO CONTAINER
              Container(
                height: 200,
                width: 200,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/logo.png",
                    // fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // APP NAME
              const Text(
                "EduLingo",
                style: TextStyle(
                  fontFamily: "Nunito",
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 10),

              // SUBTITLE
              const Text(
                "Learn Languages Easily",
                style: TextStyle(
                  fontFamily: "Nunito",
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
