import 'package:flutter/material.dart';
import 'package:language_learning_app/utils/app_colors.dart';
import 'package:language_learning_app/widgets/appbar.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/language_data.dart';
import '../widgets/button.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int index = 0;
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initTts();
  }

  void initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    await flutterTts.stop();
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! Map<String, dynamic>) {
      return const Scaffold(body: Center(child: Text("Invalid data passed")));
    }

    final language = args["language"] ?? "English";
    final category = args["category"] ?? "Greetings";

    final languageMap = LanguageData.data[language];

    if (languageMap == null || languageMap[category] == null) {
      return Scaffold(
        appBar: CustomAppBar(title: "$category ($language)"),
        body: const Center(child: Text("No data found for this category")),
      );
    }

    final words = languageMap[category]!;
    final current = words[index];

    return Scaffold(
      appBar: CustomAppBar(title: "$category ($language)"),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          current["translation"] ?? "",
                          style: const TextStyle(
                            fontSize: 40,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          current["word"] ?? "",
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.volume_up,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        speak(current["translation"] ?? "");
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Button(
                text: index == words.length - 1 ? "End" : "Next",
                onTap: () {
                  setState(() {
                    if (index < words.length - 1) {
                      index++;
                    } else {
                      Navigator.pop(context);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
