import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/optioncard.dart';

class Screen4Age extends StatefulWidget {
  const Screen4Age({super.key});

  @override
  State<Screen4Age> createState() => _Screen4AgeState();
}

class _Screen4AgeState extends State<Screen4Age> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final String? language =
        ModalRoute.of(context)?.settings.arguments as String?;
    bool canNext = selected != null;

    return Scaffold(
      appBar: const CustomAppBar(title: "Completed 4/7"),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "How old are you?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 20),

              buildCard("Under 18", "assets/images/age.png"),
              buildCard("18 - 24", "assets/images/age.png"),
              buildCard("25 - 34", "assets/images/age.png"),
              buildCard("35 - 44", "assets/images/age.png"),
              buildCard("45 - 54", "assets/images/age.png"),
              buildCard("55 - 64", "assets/images/age.png"),
              buildCard("65 - Older", "assets/images/age.png"),

              const SizedBox(height: 30),

              Button(
                text: "Next",
                onTap: canNext
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/Screen5',
                          arguments: language,
                        );
                      }
                    : () {},
              ),
            ],
          ),
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
