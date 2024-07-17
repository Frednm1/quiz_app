// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_store.dart';
import 'package:quiz_app/app/layers/presentation/ui/components/answers_component.dart';
import 'package:quiz_app/app/layers/presentation/ui/components/question_description_component.dart';

class QuizPageview extends StatefulWidget {
  final Question question;
  final VoidCallback onSumbit;
  const QuizPageview({
    super.key,
    required this.question,
    required this.onSumbit,
  });

  @override
  State<QuizPageview> createState() => _QuizPageviewState();
}

class _QuizPageviewState extends State<QuizPageview> {
  late QuizStore controller;
  List<String> answers = [];
  @override
  void initState() {
    answers = widget.question.getAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<QuizStore>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: .7,
                ),
              ),
              child: Text(
                parse(widget.question.question).body?.innerHtml ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            QuestionDescriptionComponent(
              title: 'Category: ',
              content: widget.question.category ?? '',
            ),
            const SizedBox(height: 5),
            QuestionDescriptionComponent(
              title: 'Difficulty: ',
              content: widget.question.difficulty ?? '',
            ),
            const Spacer(flex: 3),
            const Text('Select a answer'),
            AnswersComponent(answers: answers),
            const Spacer(flex: 2),
            ElevatedButton(
              onPressed: widget.onSumbit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).focusColor,
                fixedSize: Size(MediaQuery.of(context).size.width - 60, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: const Text('Next'),
            ),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}

noAnswerMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(height: 0),
            ),
          )
        ],
      );
    },
  );
}
