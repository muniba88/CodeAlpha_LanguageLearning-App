import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final String? image;
  final bool selected;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.title,
    this.image,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withOpacity(0.15) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            if (image != null)
              CircleAvatar(backgroundImage: AssetImage(image!))
            else
              const CircleAvatar(child: Icon(Icons.circle)),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
