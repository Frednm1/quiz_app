// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnswersComponent extends StatefulWidget {
  final String correctAnswer;
  final List<String> incorrectAnswers;
  const AnswersComponent({
    super.key,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  @override
  State<AnswersComponent> createState() => _AnswersComponentState();
}

class _AnswersComponentState extends State<AnswersComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.incorrectAnswers.length + 1,
        itemBuilder: (context, i) {
          // List<bool>
          return Container();
        });
  }
}
