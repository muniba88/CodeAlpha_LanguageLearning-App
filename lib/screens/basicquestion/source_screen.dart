import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/optioncard.dart';

class Screen6Source extends StatefulWidget {
  const Screen6Source({super.key});

  @override
  State<Screen6Source> createState() => _Screen6SourceState();
}

class _Screen6SourceState extends State<Screen6Source> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final String language =
        ModalRoute.of(context)!.settings.arguments as String;
    bool canNext = selected != null;

    return Scaffold(
      appBar: const CustomAppBar(title: "Completed 6/7"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Text(
                  "How did you know about EduLingo?",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              buildCard("Friend/Family", "assets/images/family.png"),
              buildCard("PlayStore", "assets/images/playstore.png"),
              buildCard("YouTube", "assets/images/youtube.png"),
              buildCard("TV", "assets/images/television.png"),
              buildCard("Podcast", "assets/images/podcast.png"),
              buildCard("Website Ad", "assets/images/website.png"),

              const SizedBox(height: 30),

              Button(
                text: "Next",
                onTap: canNext
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/Screen7',
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
