// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/answers_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/asnwer_button.dart';

class AnswersComponent extends StatefulWidget {
  final QuestionModel question;
  const AnswersComponent({
    super.key,
    required this.question,
  });

  @override
  State<AnswersComponent> createState() => _AnswersComponentState();
}

class _AnswersComponentState extends State<AnswersComponent> {
  final random = Random();
  int? correctPosition;
  late AnswerController controller;
  @override
  void initState() {
    super.initState();
    correctPosition ??= correctPosition =
        random.nextInt(widget.question.incorrectAnswers!.length + 1);
    Provider.of<AnswerController>(context, listen: false)
        .setAnswers(widget.question.incorrectAnswers!.length + 1);
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<AnswerController>(context);
    return controller.getanswerSelected.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: widget.question.incorrectAnswers!.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              if (i == correctPosition) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AnswerButton(
                    action: () {
                      controller.selectAnswer(i);
                    },
                    isActive: controller.getanswerSelected[i],
                    answer: widget.question.correctAnswer!,
                  ),
                );
              } else {
                if (i >= widget.question.incorrectAnswers!.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AnswerButton(
                      action: () {
                        controller.selectAnswer(i);
                      },
                      isActive: controller.getanswerSelected[i],
                      answer:
                          widget.question.incorrectAnswers![correctPosition!],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AnswerButton(
                      action: () {
                        controller.selectAnswer(i);
                      },
                      isActive: controller.getanswerSelected[i],
                      answer: widget.question.incorrectAnswers![i],
                    ),
                  );
                }
              }
            });
  }
}
