import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/optioncard.dart';

class Screen2Reason extends StatefulWidget {
  const Screen2Reason({super.key});

  @override
  State<Screen2Reason> createState() => _Screen2ReasonState();
}

class _Screen2ReasonState extends State<Screen2Reason> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final String language =
        ModalRoute.of(context)!.settings.arguments as String;

    bool canNext = selected != null;

    return Scaffold(
      appBar: const CustomAppBar(title: "Completed 2/7"),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Text(
                  "What is the main reason to learn $language",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              buildCard("Travel", "assets/images/travel.png"),
              buildCard("School", "assets/images/school.png"),
              buildCard("Work", "assets/images/work.png"),
              buildCard("Family/Friends", "assets/images/family.png"),
              buildCard("Skill improvement", "assets/images/skill.png"),
              buildCard("Other", "assets/images/other.png"),

              const SizedBox(height: 30),

              Button(
                text: "Next",
                onTap: canNext
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/Screen3',
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
