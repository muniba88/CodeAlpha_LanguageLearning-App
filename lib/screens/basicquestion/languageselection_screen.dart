import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/optioncard.dart';

class Screen1Language extends StatefulWidget {
  final bool fromProfile;
  const Screen1Language({super.key, this.fromProfile = false});

  @override
  State<Screen1Language> createState() => _Screen1LanguageState();
}

class _Screen1LanguageState extends State<Screen1Language> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    bool canNext = selected != null;

    return Scaffold(
      appBar: const CustomAppBar(title: "Completed 1/7"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: const Text(
                "What Language you want to learn",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 20),

            OptionCard(
              title: "English",
              image: "assets/images/English.jpg",
              selected: selected == "English",
              onTap: () => setState(() => selected = "English"),
            ),

            OptionCard(
              title: "German",
              image: "assets/images/German.jpg",
              selected: selected == "German",
              onTap: () => setState(() => selected = "German"),
            ),

            OptionCard(
              title: "French",
              image: "assets/images/French.jpg",
              selected: selected == "French",
              onTap: () => setState(() => selected = "French"),
            ),

            OptionCard(
              title: "Korean",
              image: "assets/images/Korean.jpg",
              selected: selected == "Korean",
              onTap: () => setState(() => selected = "Korean"),
            ),

            OptionCard(
              title: "Italian",
              image: "assets/images/Italian.jpg",
              selected: selected == "Italian",
              onTap: () => setState(() => selected = "Italian"),
            ),

            const Spacer(),

            // Button(
            //   text: "Next",
            //   onTap: canNext
            //       ? () {
            //           // Navigator.pushNamed(
            //           //   context,
            //           //   '/Screen2',
            //           //   arguments: selected,
            //           // );
            //           Navigator.pop(context, selected);
            //         }
            //       : () {},
            // ),
            Button(
              text: "Next",
              onTap: canNext
                  ? () {
                      if (widget.fromProfile) {
                        Navigator.pop(context, selected);
                      } else {
                        Navigator.pushNamed(
                          context,
                          '/Screen2',
                          arguments: selected,
                        );
                      }
                    }
                  : () {},
            ),
          ],
        ),
      ),
    );
  }
}
