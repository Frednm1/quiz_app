// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/paginate_controller.dart';

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
  late PaginateController paginateController;
  @override
  void initState() {
    Provider.of<QuizController>(context, listen: false).clear();
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
    paginateController = Provider.of<PaginateController>(context);

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
                      title: Text(
                          "Question ${paginateController.currentIndex + 1}"),
                      centerTitle: true,
                    ),
                    body: PageView.builder(
                      controller: paginateController.getController,
                      itemCount: controller.getQuestions.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return QuizPageview(
                          questionModel: controller.getQuestions[i],
                        );
                      },
                    ),
                  );
      },
    );
  }
}
