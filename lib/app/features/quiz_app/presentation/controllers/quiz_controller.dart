// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';

import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';

class QuizController extends ChangeNotifier {
  GetQuestionsUsecase getQuestionsUsecase;
  QuizController({
    required this.getQuestionsUsecase,
  });

  bool error = false;
  bool get haveError => error;

  late List<QuestionModel> questions;
  List<QuestionModel> get getQuestions => questions;

  Future<void> fetchQuestions(int numberOfQuestions) async {
    getQuestionsUsecase
        .call(numberOfQuestions: numberOfQuestions)
        .then((value) {
      value.fold((l) {
        setError(true);
      }, (r) {
        questions = r;
        notifyListeners();
      });
    });
  }

  void setError(bool value) {
    error = value;
    notifyListeners();
  }
}
