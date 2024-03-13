import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:quiz_app/app/features/quiz_app/data/datasources/api_datasource.dart';
import 'package:quiz_app/app/features/quiz_app/data/repositories/questions_repositorie.dart';
import 'package:quiz_app/app/features/quiz_app/domain/repositories/questions_repositorie.dart';
import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //client
    getIt.registerLazySingleton(() => HttpClient());
    //datasources

    getIt.registerLazySingleton<ApiDatasource>(
        () => ApiDatasourceImpl(client: getIt()));

    //repositories

    getIt.registerLazySingleton<QuestionsRepositorie>(
        () => QuestionsRepositorieImpl(api: getIt()));

    //usecases

    getIt.registerLazySingleton<GetQuestionsUsecase>(
        () => GetQuestionsUsecaseImpl(repo: getIt()));
  }
}
