import 'package:flutter/material.dart';
import 'package:language_learning_app/widgets/appbar.dart';
import '../../utils/app_colors.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String language =
        ModalRoute.of(context)?.settings.arguments as String? ?? "English";

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "$language Course"),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Course Progress",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  buildCard(context, "Greetings", language),
                  buildCard(context, "Common Words", language),
                  buildCard(context, "Relations", language),
                  buildCard(context, "Daily Life", language),
                  buildCard(context, "Question Words", language),
                  buildCard(context, "Sentences", language),
                  // buildCard(context, "Quiz", language),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/quiz',
                        arguments: {"language": language},
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quiz",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CARD
  Widget buildCard(BuildContext context, String title, String language) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/greeting', // ✅ dynamic route now
          arguments: {
            "language": language, // ✅ dynamic now
            "category": title,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}
