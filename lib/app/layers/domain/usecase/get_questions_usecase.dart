import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';
import 'package:quiz_app/app/layers/domain/repository/questions_repository.dart';

abstract class GetQuestionsUsecase {
  Future<List<Question>> call({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  });
}

class GetQuestionsUsecaseImpl implements GetQuestionsUsecase {
  final QuestionsRepository repo;

  GetQuestionsUsecaseImpl({required this.repo});
  @override
  Future<List<Question>> call(
      {required int numberOfQuestions,
      String? difficulty,
      int? category,
      String? type}) async {
    return await repo.getQuestions(
      numberOfQuestions: numberOfQuestions,
      category: category,
      difficulty: difficulty,
      type: type,
    );
  }
}
