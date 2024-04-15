// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/paginate_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/answers_component.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/question_description_component.dart';

class QuizPageview extends StatefulWidget {
  final QuestionModel questionModel;
  const QuizPageview({
    super.key,
    required this.questionModel,
  });

  @override
  State<QuizPageview> createState() => _QuizPageviewState();
}

class _QuizPageviewState extends State<QuizPageview> {
  late PaginateController paginateController;
  late QuizController quizController;
  @override
  Widget build(BuildContext context) {
    paginateController = Provider.of<PaginateController>(context);
    quizController = Provider.of<QuizController>(context);
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
                parse(widget.questionModel.question).body?.innerHtml ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionDescriptionComponent(
              title: 'Category: ',
              content: widget.questionModel.category!,
            ),
            const SizedBox(
              height: 5,
            ),
            QuestionDescriptionComponent(
              title: 'Difficulty: ',
              content: widget.questionModel.difficulty!,
            ),
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
                quizController.selectedAnswer != null
                    ? quizController.submitAnswer()
                    : noAnswerMessage(context);
                if (paginateController.currentIndex ==
                    quizController.questions.length - 1) {
                  paginateController.naviteToFinishPage(context);
                } else {
                  paginateController.navigate(quizController.questions.length);
                }
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
