import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';

abstract class QuestionsRepository {
  Future<List<Question>> getQuestions({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  });
}
