import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/paginate_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/asnwer_button.dart';

class AnswersComponent extends StatefulWidget {
  const AnswersComponent({
    super.key,
  });

  @override
  State<AnswersComponent> createState() => _AnswersComponentState();
}

class _AnswersComponentState extends State<AnswersComponent> {
  late PaginateController paginateController;
  late QuizController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<QuizController>(context);
    paginateController = Provider.of<PaginateController>(context);

    return controller.getAnswers.isEmpty
        ? const Center(
            child: LinearProgressIndicator(),
          )
        : ListView.builder(
            itemCount:
                controller.getAnswers[paginateController.currentIndex].length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: AnswerButton(
                  action: () {
                    controller.selectAnswer(controller
                        .getAnswers[paginateController.currentIndex][i]);
                  },
                  isActive: controller.getSelectedAnswer ==
                          controller.getAnswers[paginateController.currentIndex]
                              [i]
                      ? true
                      : false,
                  answer: controller.getAnswers[paginateController.currentIndex]
                      [i],
                ),
              );
            },
          );
  }
}
