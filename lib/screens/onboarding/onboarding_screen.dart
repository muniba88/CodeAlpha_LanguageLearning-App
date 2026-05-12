import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../auth/login_screen.dart';
import 'onboarding_view.dart';

class OnboardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int currentIndex;

  const OnboardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: [
          const Spacer(),

          // IMAGE
          SizedBox(
            height: size.height * 0.35,
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          const SizedBox(height: 40),

          // DOTS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),

                margin: const EdgeInsets.symmetric(horizontal: 5),

                height: 10,
                width: currentIndex == index ? 28 : 10,

                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors.primary
                      : AppColors.secondary,

                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // TITLE
          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontFamily: "Nunito",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 16),

          // DESCRIPTION
          Text(
            description,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontFamily: "Nunito",
              fontSize: 16,
              height: 1.5,
              color: AppColors.textLight,
            ),
          ),

          const SizedBox(height: 40),

          // BUTTON
          SizedBox(
            width: double.infinity,
            height: 58,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              onPressed: () {
                // NEXT SCREEN
                if (currentIndex < 2) {
                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          OnboardingView(initialPage: currentIndex + 1),
                    ),
                  );
                } else {
                  // LOGIN SCREEN
                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                }
              },

              child: Text(
                currentIndex == 2 ? "Get Started" : "Choose Language",

                style: const TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // LOGIN TEXT
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,

                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },

            child: RichText(
              text: const TextSpan(
                text: "Already a fillolearn user? ",

                style: TextStyle(
                  fontFamily: "Nunito",
                  color: AppColors.textLight,
                  fontSize: 15,
                ),

                children: [
                  TextSpan(
                    text: "Log in",

                    style: TextStyle(
                      fontFamily: "Nunito",
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
