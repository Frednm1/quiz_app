// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/components/question_description_component.dart';

class QuizPageview extends StatefulWidget {
  final String question;
  final List<String> incorrectAnswers;
  final String category;
  final String type;
  final String correctAnswer;
  final String difficulty;
  const QuizPageview({
    required this.question,
    required this.incorrectAnswers,
    required this.category,
    required this.type,
    required this.difficulty,
    required this.correctAnswer,
    super.key,
  });

  @override
  State<QuizPageview> createState() => _QuizPageviewState();
}

class _QuizPageviewState extends State<QuizPageview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            parse(widget.question).body?.innerHtml ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionDescriptionComponent(
              title: 'Category', content: widget.category),
          const SizedBox(
            height: 5,
          ),
          QuestionDescriptionComponent(
              title: 'Difficulty', content: widget.difficulty),
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
