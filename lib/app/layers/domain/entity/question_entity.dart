import 'package:equatable/equatable.dart';

class Question with EquatableMixin {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Question({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  List<String> getAnswers() {
    List<String> list = [];
    for (String answer in incorrectAnswers!) {
      list.add(answer);
    }
    list.add(correctAnswer!);
    list.shuffle();
    return list;
  }

  @override
  List<Object?> get props => [
        type,
        difficulty,
        category,
        question,
        correctAnswer,
        incorrectAnswers,
      ];
}
