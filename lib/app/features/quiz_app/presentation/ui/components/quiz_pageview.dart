// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/answers_component.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/question_description_component.dart';

class QuizPageview extends StatefulWidget {
  const QuizPageview({
    super.key,
  });

  @override
  State<QuizPageview> createState() => _QuizPageviewState();
}

class _QuizPageviewState extends State<QuizPageview> {
  late QuizController controller;
  @override
  Widget build(BuildContext context) {
    controller = Provider.of<QuizController>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              parse(controller.getQuestions[controller.currentIndex].question).body?.innerHtml ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionDescriptionComponent(
                title: 'Category: ', content: controller.getQuestions[controller.currentIndex].category!),
            const SizedBox(
              height: 5,
            ),
            QuestionDescriptionComponent(
                title: 'Difficulty: ', content: controller.getQuestions[controller.currentIndex].difficulty!),
            const Spacer(
              flex: 3,
            ),
            const Text('Select a answer'),
            const AnswersComponent(),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
              onPressed: () {
                controller.submitAnswer(context);
              },
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
