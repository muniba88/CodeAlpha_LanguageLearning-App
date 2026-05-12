import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/optioncard.dart';

class Screen5Time extends StatefulWidget {
  const Screen5Time({super.key});

  @override
  State<Screen5Time> createState() => _Screen5TimeState();
}

class _Screen5TimeState extends State<Screen5Time> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final String language =
        ModalRoute.of(context)!.settings.arguments as String;

    bool canNext = selected != null;

    return Scaffold(
      appBar: const CustomAppBar(title: "Completed 5/7"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Text(
                "How much time do you want to spend daily on learning?",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildCard("5 min/day", "assets/images/time1.png"),
            buildCard("15 min/day", "assets/images/time2.png"),
            buildCard("30 min/day", "assets/images/time3.png"),
            buildCard("60 min/day", "assets/images/time4.png"),

            const Spacer(),

            Button(
              text: "Next",
              onTap: canNext
                  ? () {
                      Navigator.pushNamed(
                        context,
                        '/Screen6',
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
