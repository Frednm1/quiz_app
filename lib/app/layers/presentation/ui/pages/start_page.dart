import 'package:flutter/material.dart';
import 'package:quiz_app/app/layers/presentation/ui/pages/config_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Welcome to the Quiz App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/doubt.png',
            height: 275,
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'You can choose the type, difficulty and how many questions you want to answer and at the end you will receive feedback on your result.\n\n Good luck :) !',
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              navigateToConfigPage(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).focusColor,
              fixedSize: Size(MediaQuery.of(context).size.width - 60, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: const Text('Continue'),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  navigateToConfigPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ConfigPage();
    }));
  }
}
