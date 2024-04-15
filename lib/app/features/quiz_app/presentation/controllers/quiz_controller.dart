// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';

class QuizController extends ChangeNotifier {
  GetQuestionsUsecase getQuestionsUsecase;
  QuizController({
    required this.getQuestionsUsecase,
  });

  String? selectedAnswer;
  String? get getSelectedAnswer => selectedAnswer;

  List<String> selectedAnswers = [];
  List<String> get getSelectedAnswers => selectedAnswers;

  bool error = false;
  bool get haveError => error;

  List<QuestionModel> questions = [];
  List<QuestionModel> get getQuestions => questions;

  List<List<String>> answers = [];
  List<List<String>> get getAnswers => answers;

  int get numberOfCorrectQuestions => getNumberOfCorrectQuestions();

  Future<void> fetchQuestions({
    required int numberOfQuestions,
    String? difficulty,
    String? type,
    int? category,
  }) async {
    getQuestionsUsecase
        .call(
      numberOfQuestions: numberOfQuestions,
      category: category,
      difficulty: difficulty,
      type: type,
    )
        .then((value) {
      value.fold((l) {
        setError(true);
      }, (r) {
        questions = r;
        generateAnswers();
        notifyListeners();
      });
    });
  }

  void generateAnswers() {
    for (int i = 0; i < questions.length; i++) {
      answers.add(generateShuffleAnswers(questions[i]));
    }
  }

  List<String> generateShuffleAnswers(QuestionModel question) {
    List<String> list = [];
    list.add(question.correctAnswer!);
    for (String incorrectAnswer in question.incorrectAnswers!) {
      list.add(incorrectAnswer);
    }
    list.shuffle();
    return list;
  }

  submitAnswer() {
    selectedAnswers.add(selectedAnswer!);
    selectedAnswer = null;
  }

  int getNumberOfCorrectQuestions() {
    int correctAnswers = 0;
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].correctAnswer == selectedAnswers[i]) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  selectAnswer(String value) {
    selectedAnswer = value;
    notifyListeners();
  }

  void clear() {
    answers = [];
    questions = [];
    selectedAnswers = [];
  }

  void setError(bool value) {
    error = value;
    notifyListeners();
  }
}
