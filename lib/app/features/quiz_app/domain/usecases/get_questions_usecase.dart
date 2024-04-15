import 'package:dartz/dartz.dart';
import 'package:quiz_app/app/core/errors/failure.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/domain/repositories/questions_repositorie.dart';

abstract class GetQuestionsUsecase {
  Future<Either<Failure, List<QuestionModel>>> call({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  });
}

class GetQuestionsUsecaseImpl implements GetQuestionsUsecase {
  final QuestionsRepositorie repo;

  GetQuestionsUsecaseImpl({required this.repo});
  @override
  Future<Either<Failure, List<QuestionModel>>> call(
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
