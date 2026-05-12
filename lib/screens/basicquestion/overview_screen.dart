import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';

class Screen7Overview extends StatefulWidget {
  const Screen7Overview({super.key});
  @override
  State<Screen7Overview> createState() => _Screen7OverviewState();
}

class _Screen7OverviewState extends State<Screen7Overview> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final String language =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: const CustomAppBar(title: "Course Overview"),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Course Overview",
              style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Start your journey with structured learning and daily practice.",
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: "Nunito", fontSize: 20),
            ),

            const SizedBox(height: 20),

            const Text(
              "Course Content",
              style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                containerBox("9000+", "Words"),
                containerBox("200+", "Sentences"),
              ],
            ),
            const Spacer(),

            Button(
              text: "Next",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/Congratulations',
                  arguments: language,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget containerBox(String number, String label) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(child: Icon(Icons.book)),
          const SizedBox(height: 10),
          Text(
            number,
            style: const TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}
