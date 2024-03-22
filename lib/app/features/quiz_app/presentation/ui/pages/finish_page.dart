import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/quiz_controller.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  late QuizController controller;
  @override
  Widget build(BuildContext context) {
    controller = Provider.of<QuizController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text('CONGRATULATIONS',style: TextStyle(
              fontSize: 24,
            ),),
            const SizedBox(height: 20,),
            Image.asset('assets/images/celebration.png',height: 275,),
            const SizedBox(height: 20,),
            Text("You completed your quiz and got ${controller.numberOfCorrectQuestions} questions out of ${controller.getQuestions.length} correct",style: const TextStyle(
              fontSize: 20,
            ),),
            const SizedBox(height: 60,),
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
          ],
        ),
      ),
    );
  }
}