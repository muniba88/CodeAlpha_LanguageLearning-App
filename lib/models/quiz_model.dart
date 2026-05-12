class QuizModel {
  final String question;
  final String correctAnswer;
  final List<String> options;

  QuizModel({
    required this.question,
    required this.correctAnswer,
    required this.options,
  });
}
