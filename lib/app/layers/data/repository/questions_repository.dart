import 'package:quiz_app/app/layers/data/datasource/api_datasource.dart';
import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';
import 'package:quiz_app/app/layers/domain/repository/questions_repository.dart';

class QuestionsRepositorieImpl implements QuestionsRepository {
  final ApiDatasource api;
  QuestionsRepositorieImpl({required this.api});

  @override
  Future<List<Question>> getQuestions({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  }) async {
    return await api.getQuestions(
      numberOfQuestions: numberOfQuestions,
      category: category,
      difficulty: difficulty,
      type: type,
    );
  }
}
