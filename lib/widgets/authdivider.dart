import 'package:flutter/material.dart';
import 'package:language_learning_app/utils/app_colors.dart';

class AuthDivider extends StatelessWidget {
  final Color color;
  final String text;

  const AuthDivider({
    super.key,
    this.color = AppColors.primary,
    this.text = "or",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: color, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Nunito",
            ),
          ),
        ),
        Expanded(child: Divider(color: color, thickness: 1)),
      ],
    );
  }
}
