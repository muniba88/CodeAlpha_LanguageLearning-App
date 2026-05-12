import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? language =
        ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const CustomAppBar(title: ""),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// IMAGE
            Center(
              child: Image.asset(
                "assets/images/congratulation.png",
                height: 220,
                width: 220,
              ),
            ),

            const SizedBox(height: 30),

            /// HEADING
            const Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 15),

            /// DESCRIPTION
            const Text(
              "Your learning journey is ready to begin. Stay consistent and achieve your language goals with EduLingo.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textLight,
                height: 1.5,
                fontFamily: "Nunito",
              ),
            ),

            const Spacer(),

            /// BUTTON
            Button(
              text: "Continue",
              onTap: () {
                // Navigate to home screen
                Navigator.pushNamed(context, '/Navbar', arguments: language);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
