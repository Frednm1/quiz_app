import 'package:flutter/material.dart';

class AnswerController extends ChangeNotifier {
  List<bool> answerSelected = [];
  List<bool> get getanswerSelected => answerSelected;

  selectAnswer(int position) {
    answerSelected =
        List.from(List.generate(answerSelected.length, (_) => false));
    answerSelected[position] = true;
    notifyListeners();
  }

  setAnswers(int numberOfAnswers) {
    answerSelected = List.generate(numberOfAnswers, (index) => false);
  }
}
