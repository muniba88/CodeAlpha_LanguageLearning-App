import 'package:flutter/material.dart';
import 'package:language_learning_app/utils/app_colors.dart';

class SocialBox extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const SocialBox({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.secondary, width: 1.5),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 34,
            width: 34,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
