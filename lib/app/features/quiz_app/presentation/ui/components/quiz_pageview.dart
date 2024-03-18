// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/answers_component.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/question_description_component.dart';

class QuizPageview extends StatefulWidget {
  final QuestionModel question;
  const QuizPageview({
    super.key,
    required this.question,
  });

  @override
  State<QuizPageview> createState() => _QuizPageviewState();
}

class _QuizPageviewState extends State<QuizPageview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              parse(widget.question.question).body?.innerHtml ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            QuestionDescriptionComponent(
                title: 'Category', content: widget.question.category!),
            const SizedBox(
              height: 5,
            ),
            QuestionDescriptionComponent(
                title: 'Difficulty', content: widget.question.difficulty!),
            const Spacer(
              flex: 3,
            ),
            const Text('Select a answer'),
            AnswersComponent(
              question: widget.question,
            ),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).focusColor,
                fixedSize: Size(MediaQuery.of(context).size.width - 60, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: const Text('Next'),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
