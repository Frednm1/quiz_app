import 'package:get_it/get_it.dart';
import 'package:quiz_app/app/core/client/http_client.dart';
import 'package:quiz_app/app/layers/data/datasource/api_datasource.dart';
import 'package:quiz_app/app/layers/data/repository/questions_repository.dart';
import 'package:quiz_app/app/layers/domain/repository/questions_repository.dart';
import 'package:quiz_app/app/layers/domain/usecase/get_questions_usecase.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //client
    getIt.registerLazySingleton<HttpClient>(() => HttpClientImpl());

    //datasources
    getIt.registerLazySingleton<ApiDatasource>(
      () => ApiDatasourceImpl(httpClient: getIt()),
    );

    //repositories
    getIt.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositorieImpl(api: getIt()),
    );

    //usecases
    getIt.registerLazySingleton<GetQuestionsUsecase>(
      () => GetQuestionsUsecaseImpl(repo: getIt()),
    );
  }
}
