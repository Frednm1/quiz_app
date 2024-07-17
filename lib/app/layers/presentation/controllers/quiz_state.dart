import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';

enum QuizPageStatus { loading, initial, ok, error }

class QuizState {
  final String currentAnswer;
  final List<Question> questions;
  final List<String> answers;
  final QuizPageStatus status;
  final String error;

  const QuizState({
    this.currentAnswer = '',
    this.questions = const [],
    this.answers = const [],
    this.status = QuizPageStatus.initial,
    this.error = '',
  });

  QuizState copyWith({
    String? currentAnswer,
    List<Question>? questions,
    List<String>? answers,
    QuizPageStatus? status,
    String? error,
  }) {
    return QuizState(
      currentAnswer: currentAnswer ?? this.currentAnswer,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
