import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';

class QuestionModel extends Question {
  QuestionModel({
    super.category,
    super.type,
    super.difficulty,
    super.question,
    super.incorrectAnswers,
    super.correctAnswer,
  });

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
