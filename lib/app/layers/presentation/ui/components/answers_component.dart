import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_store.dart';
import 'package:quiz_app/app/layers/presentation/ui/components/asnwer_button.dart';

class AnswersComponent extends StatefulWidget {
  final List<String> answers;
  const AnswersComponent({
    super.key,
    required this.answers,
  });

  @override
  State<AnswersComponent> createState() => _AnswersComponentState();
}

class _AnswersComponentState extends State<AnswersComponent> {
  late QuizStore store;
  List<String> answers = [];

  @override
  Widget build(BuildContext context) {
    store = Provider.of<QuizStore>(context);
    return ListView.builder(
      itemCount: widget.answers.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: AnswerButton(
            action: () {
              store.setCurrentAnswer(widget.answers[i]);
            },
            isActive: widget.answers[i] == store.state.currentAnswer,
            answer: widget.answers[i],
          ),
        );
      },
    );
  }
}
