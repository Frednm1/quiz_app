import 'package:dartz/dartz.dart';
import 'package:quiz_app/app/core/errors/failure.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/domain/repositories/questions_repositorie.dart';

abstract class GetQuestionsUsecase {
  Future<Either<Failure, QuestionsModel>> call(
      {required int numberOfQuestions});
}

class GetQuestionUsecaseImpl implements GetQuestionsUsecase {
  final QuestionsRepositorie repo;

  GetQuestionUsecaseImpl(this.repo);
  @override
  Future<Either<Failure, QuestionsModel>> call(
      {required int numberOfQuestions}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
