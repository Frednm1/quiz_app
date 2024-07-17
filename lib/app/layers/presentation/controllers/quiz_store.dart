import 'package:flutter/material.dart';
import 'package:quiz_app/app/layers/data/model/config_form_model.dart';
import 'package:quiz_app/app/layers/domain/usecase/get_questions_usecase.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_state.dart';

class QuizStore extends ChangeNotifier {
  QuizStore({
    required this.getQuestionsUsecase,
  });
  GetQuestionsUsecase getQuestionsUsecase;
  QuizState state = const QuizState();

  fetchQuestions({
    required ConfigFormModel config,
  }) async {
    state = state.copyWith(status: QuizPageStatus.loading);
    try {
      final questions = await getQuestionsUsecase.call(
        numberOfQuestions: config.numberOfQuestions,
        category: config.category,
        difficulty: config.difficulty,
        type: config.type,
      );
      state = state.copyWith(status: QuizPageStatus.ok, questions: questions);
      notifyListeners();
    } catch (e) {
      state = state.copyWith(status: QuizPageStatus.error, error: e.toString());
      notifyListeners();
    }
  }

  setCurrentAnswer(String answer) {
    state = state.copyWith(currentAnswer: answer);
    notifyListeners();
  }

  saveAnswer(int i) {
    List<String> list = List.from(state.answers);
    if (i >= state.answers.length) {
      list.add(state.currentAnswer);
      state = state.copyWith(answers: list);
    } else {
      list[i] = state.currentAnswer;
      state = state.copyWith(answers: list);
    }
    print(state.answers);
    notifyListeners();
  }

  int getNumberOfCorrectAnswers() {
    int counter = 0;
    for (int i = 0; i < state.answers.length; i++) {
      if (state.answers[i] == state.questions[i].correctAnswer) {
        counter++;
      }
    }
    return counter;
  }

  reset() {
    state = const QuizState();
  }
}
