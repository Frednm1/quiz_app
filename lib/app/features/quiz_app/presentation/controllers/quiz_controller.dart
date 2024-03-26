// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/pages/finish_page.dart';

class QuizController extends ChangeNotifier {
  GetQuestionsUsecase getQuestionsUsecase;
  PageController pc = PageController();
  QuizController({
    required this.getQuestionsUsecase,
  });

  String? selectedAnswer;
  String? get getSelectedAnswer => selectedAnswer;
  
  List<String> selectedAnswers = [];
  List<String> get getSelectedAnswers => selectedAnswers;

  int index = 0;
  int get currentIndex => index;

  bool error = false;
  bool get haveError => error;

  List<QuestionModel> questions = [];
  List<QuestionModel> get getQuestions => questions;

  List<List<String>> answers = [];
  List<List<String>> get getAnswers => answers;

  int get numberOfCorrectQuestions => getNumberOfCorrectQuestions();


  Future<void> fetchQuestions(
      {required int numberOfQuestions,
      String? difficulty,
      String? type,
      int? category}) async {
    getQuestionsUsecase.call(
            numberOfQuestions: numberOfQuestions,
            category: category,
            difficulty: difficulty,
            type: type,)
        .then((value) {
      value.fold((l) {
        setError(true);
      }, (r) {
        questions = r;
        generateAnswers(questions);
        notifyListeners();
      });
    });
  }

  void generateAnswers(List<QuestionModel> questions){
    for (int i = 0; i < questions.length; i++){
      answers.add([]);
      answers[i].add(questions[i].correctAnswer!);
      for(int j = 0; j < questions[i].incorrectAnswers!.length; j++){
          answers[i].add(questions[i].incorrectAnswers![j]);
      }
      answers[i].shuffle();
    }
  }

  submitAnswer(BuildContext context){
    if(selectedAnswer != null){
      
      if(currentIndex == questions.length -1){
        selectedAnswers.add(selectedAnswer!);
        selectedAnswer = null;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return const FinishPage();
        }));
      }else{
        selectedAnswers.add(selectedAnswer!);
        selectedAnswer = null;
        setIndex(currentIndex + 1,context);
        notifyListeners();
      }
      
    }else{
      showDialog(context:context , builder: (context){
          return AlertDialog.adaptive(
            content: const Text(
            'Please answer one of the questions to proceed',
            style: TextStyle(
              fontSize: 20,
              height: 1.2,
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text(
                'OK',
                style: TextStyle(height: 0)
                ,)
              ,)
            ],
          
          );
          },
        );
    }
  }

  int getNumberOfCorrectQuestions(){
    int correctAnswers = 0;
    for(String response in selectedAnswers){
      if(questions.any((element) => element.correctAnswer == response)){
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  selectAnswer(String value){
    selectedAnswer = value;
    notifyListeners();
  }

  void clear(){
    answers = [];
    questions = [];
    index = 0;
  }

  void setIndex(int value,BuildContext context) {
    index = value;
      notifyListeners();
  }

  void setError(bool value) {
    error = value;
    notifyListeners();
  }
}
