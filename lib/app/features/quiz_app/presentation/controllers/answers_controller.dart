import 'dart:math';

import 'package:flutter/material.dart';

class AnswerController extends ChangeNotifier {
  final random = Random();
  int? correctPosition;
  int? get getCorrectPosition => correctPosition;

  List<bool> answerSelected = [];
  List<bool> get getanswerSelected => answerSelected;

  selectAnswer(int position) {
    answerSelected =
        List.from(List.generate(answerSelected.length, (_) => false));
    answerSelected[position] = true;
    notifyListeners();
  }


  setCorrectPosition(int numberOfQuestions){
    correctPosition = random.nextInt(numberOfQuestions);
  }
  setAnswers(int numberOfAnswers) {
    answerSelected = List.generate(numberOfAnswers, (index) => false);
  }
}
