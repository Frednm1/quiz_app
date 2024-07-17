import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/core/inject/inject.dart';
import 'package:quiz_app/app/layers/domain/usecase/get_questions_usecase.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_store.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/app/layers/presentation/ui/pages/start_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromRGBO(45, 51, 59, 1),
      statusBarColor: Color.fromRGBO(45, 51, 59, 1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizStore(
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
