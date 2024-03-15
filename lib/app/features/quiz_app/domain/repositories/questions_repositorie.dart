import 'package:dartz/dartz.dart';
import 'package:quiz_app/app/core/errors/failure.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';

abstract class QuestionsRepositorie {
  Future<Either<Failure, List<QuestionModel>>> getQuestions({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  });
}
