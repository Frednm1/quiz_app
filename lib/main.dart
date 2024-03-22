import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/core/inject/inject.dart';
import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/controllers/quiz_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/app/features/quiz_app/presentation/ui/pages/start_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizController(
            getQuestionsUsecase: GetIt.I.get<GetQuestionsUsecase>(),
          ),
        ),
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(45, 51, 59, 1),
        brightness: Brightness.dark,
      ),
      home: const StartPage(),
    );
  }
}
