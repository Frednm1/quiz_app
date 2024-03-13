import 'package:dartz/dartz.dart';
import 'package:quiz_app/app/core/errors/failure.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';

abstract class QuestionsRepositorie {
  Future<Either<Failure, QuestionsModel>> getQuestions({
    required int numberOfQuestions,
  });
}
