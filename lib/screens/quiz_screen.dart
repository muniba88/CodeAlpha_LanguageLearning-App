import 'dart:math';
import 'package:flutter/material.dart';
import '../data/language_data.dart';
import '../models/quiz_model.dart';
import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int? selectedIndex;
  bool answered = false;
  String language = "English";

  List<QuizModel> quizzes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // final language = args["language"];
    language = args["language"] ?? "English";

    // quizzes = generateQuiz(language);
    if (quizzes.isEmpty) {
      quizzes = generateQuiz(language);
    }
  }

  List<QuizModel> generateQuiz(String language) {
    final languageMap = LanguageData.data[language]!;

    List<Map<String, String>> allWords = [];

    languageMap.forEach((key, value) {
      allWords.addAll(value);
    });

    List<QuizModel> quizList = [];

    for (var item in allWords) {
      List<String> options = [];

      options.add(item["translation"]!);

      final random = Random();

      while (options.length < 4) {
        final randomWord =
            allWords[random.nextInt(allWords.length)]["translation"]!;

        if (!options.contains(randomWord)) {
          options.add(randomWord);
        }
      }

      options.shuffle();

      quizList.add(
        QuizModel(
          question: item["word"]!,
          correctAnswer: item["translation"]!,
          options: options,
        ),
      );
    }

    quizList.shuffle();

    return quizList.take(10).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (quizzes.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final quiz = quizzes[currentIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "Quiz ($language)"),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "What is the meaning of this?",
              style: const TextStyle(
                fontFamily: "Nunito",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  quiz.question,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            ...List.generate(4, (index) {
              final option = quiz.options[index];

              bool isCorrect = option == quiz.correctAnswer;

              return GestureDetector(
                onTap: answered
                    ? null
                    : () {
                        setState(() {
                          selectedIndex = index;
                          answered = true;
                        });
                      },

                child: Container(
                  width: double.infinity,

                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: answered
                        ? isCorrect
                              ? Colors.green.withOpacity(0.2)
                              : selectedIndex == index
                              ? Colors.red.withOpacity(0.2)
                              : Colors.white
                        : Colors.white,

                    borderRadius: BorderRadius.circular(16),

                    border: Border.all(color: Colors.grey.shade300),
                  ),

                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }),

            const Spacer(),

            Button(
              text: currentIndex == quizzes.length - 1 ? "Finish" : "Next",

              onTap: answered
                  ? () {
                      setState(() {
                        if (currentIndex < quizzes.length - 1) {
                          currentIndex++;
                          selectedIndex = null;
                          answered = false;
                        } else {
                          Navigator.pop(context);
                        }
                      });
                    }
                  : () {},
            ),
          ],
        ),
      ),
    );
  }
}
