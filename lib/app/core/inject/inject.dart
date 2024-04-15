import 'package:get_it/get_it.dart';
import 'package:quiz_app/app/core/client/http_client.dart';
import 'package:quiz_app/app/features/quiz_app/data/datasources/api_datasource.dart';
import 'package:quiz_app/app/features/quiz_app/data/repositories/questions_repositorie.dart';
import 'package:quiz_app/app/features/quiz_app/domain/repositories/questions_repositorie.dart';
import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //client
    getIt.registerLazySingleton<HttpClient>(() => HttpClientImpl());
    //datasources

    getIt.registerLazySingleton<ApiDatasource>(
        () => ApiDatasourceImpl(httpClient: getIt()));

    //repositories

    getIt.registerLazySingleton<QuestionsRepositorie>(
        () => QuestionsRepositorieImpl(api: getIt()));

    //usecases

    getIt.registerLazySingleton<GetQuestionsUsecase>(
        () => GetQuestionsUsecaseImpl(repo: getIt()));
  }
}
