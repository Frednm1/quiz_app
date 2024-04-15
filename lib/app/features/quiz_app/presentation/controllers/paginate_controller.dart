import 'package:flutter/material.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/pages/finish_page.dart';

class PaginateController extends ChangeNotifier {
  PageController pc = PageController();
  PageController get getController => pc;

  int index = 0;
  int get currentIndex => index;

  void setIndex(int value) {
    index = value;
    notifyListeners();
  }

  void navigate(int numberOfPages) {
    setIndex(index + 1);
    nextPage();
  }

  void nextPage() {
    pc.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void previousPage(int index) {
    pc.animateToPage(
      index - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  naviteToFinishPage(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const FinishPage();
    }));
  }
}
