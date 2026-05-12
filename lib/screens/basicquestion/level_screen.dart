import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/optioncard.dart';

class Screen3Level extends StatefulWidget {
  const Screen3Level({super.key});

  @override
  State<Screen3Level> createState() => _Screen3LevelState();
}

class _Screen3LevelState extends State<Screen3Level> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final String? language =
        ModalRoute.of(context)?.settings.arguments as String?;

    bool canNext = selected != null;

    return Scaffold(
      appBar: const CustomAppBar(title: "Completed 3/7"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "How much you know about $language?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20),

            buildCard("Not much", "assets/images/poor.png"),
            buildCard("Medium", "assets/images/medium.png"),
            buildCard("Expert", "assets/images/expert.png"),

            const Spacer(),

            Button(
              text: "Next",
              onTap: canNext
                  ? () {
                      Navigator.pushNamed(
                        context,
                        '/Screen4',
                        arguments: language,
                      );
                    }
                  : () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String image) {
    return OptionCard(
      title: title,
      image: image,
      selected: selected == title,
      onTap: () => setState(() => selected = title),
    );
  }
}
