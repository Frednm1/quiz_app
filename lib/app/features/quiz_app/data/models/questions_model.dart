import 'package:quiz_app/app/features/quiz_app/domain/entities/question_entitie.dart';

class QuestionModel extends QuestionEntitie {
  QuestionModel({
    required String category,
    required String type,
    required String difficulty,
    required String question,
    required List<String> incorrectAnswers,
    required String correctAnswer,
  }) : super(
          category: category,
          type: type,
          difficulty: difficulty,
          question: question,
          incorrectAnswers: incorrectAnswers,
          correctAnswer: correctAnswer,
        );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
      correctAnswer: json['correct_answer'],
    );
  }
}
