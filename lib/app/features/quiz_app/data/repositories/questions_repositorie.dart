import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quiz_app/app/core/errors/exceptions.dart';
import 'package:quiz_app/app/core/errors/failure.dart';
import 'package:quiz_app/app/features/quiz_app/data/datasources/api_datasource.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/domain/repositories/questions_repositorie.dart';

class QuestionsRepositorieImpl implements QuestionsRepositorie {
  final ApiDatasource api;
  QuestionsRepositorieImpl({required this.api});
  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required int numberOfQuestions}) async {
    try {
      final response =
          await api.getQuestions(numberOfQuestions: numberOfQuestions);
      final decode = jsonDecode(response.body);
      List<QuestionModel> list = [];
      decode['results'].forEach((value) {
        list.add(QuestionModel.fromJson(value));
      });
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
