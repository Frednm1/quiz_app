import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_store.dart';
import 'package:quiz_app/app/layers/presentation/ui/components/answer_feedback_component.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  late QuizStore store;
  @override
  Widget build(BuildContext context) {
    store = Provider.of<QuizStore>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Text(
                'CONGRATULATIONS',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/celebration.png',
                height: 275,
              ),
              const SizedBox(height: 20),
              Text(
                "You completed your quiz and got ${store.getNumberOfCorrectAnswers()} questions out of  correct",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: store.state.questions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return AnswerFeedbackComponent(
                      text: parse(store.state.questions[i].question!)
                          .body!
                          .innerHtml,
                      correct: store.state.questions[i].correctAnswer ==
                          store.state.answers[i],
                    );
                  }),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).focusColor,
                  fixedSize: Size(MediaQuery.of(context).size.width - 60, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text('Restart'),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
