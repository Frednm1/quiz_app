// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/app/features/quiz_app/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/quiz_pageview.dart';

class QuizPage extends StatefulWidget {
  final int numberOfQuestions;
  final int? category;
  final String? type;
  final String? difficulty;
  const QuizPage({
    required this.numberOfQuestions,
    this.category,
    this.type,
    this.difficulty,
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    Provider.of<QuizController>(context, listen: false).fetchQuestions(
      numberOfQuestions: widget.numberOfQuestions,
      category: widget.category,
      difficulty: widget.difficulty,
      type: widget.type,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizController>(
      builder: (context, controller, _) {
        return controller.haveError
            ? const Center(
                child: Text('Something went wrong'),
              )
            : controller.getQuestions.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Scaffold(
                    appBar: AppBar(
                      title: Text("Question ${controller.currentIndex + 1}"),
                      centerTitle: true,
                    ),
                    body: PageView.builder(
                      itemCount: controller.getQuestions.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return QuizPageview(
                          question: controller.getQuestions[i].question!,
                          difficulty: controller.getQuestions[i].difficulty!,
                          incorrectAnswers:
                              controller.getQuestions[i].incorrectAnswers!,
                          category: controller.getQuestions[i].category!,
                          type: controller.getQuestions[i].type!,
                          correctAnswer:
                              controller.getQuestions[i].correctAnswer!,
                        );
                      },
                    ),
                  );
      },
    );
  }
}
