import 'dart:convert';

import 'package:quiz_app/app/core/client/http_client.dart';
import 'package:quiz_app/app/features/quiz_app/data/datasources/api_datasource.dart';
import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
import 'package:quiz_app/app/features/quiz_app/data/repositories/questions_repositorie.dart';
import 'package:test/test.dart';

QuestionsModel? data;
void main() {
  setUp(() async {
    await ApiDatasourceImpl(HttpClientImpl())
        .getQuestions(numberOfQuestions: 10)
        .then((value) {
      var data = QuestionsModel.fromJson(jsonDecode(value.body));
      print(data.questions![0].question);
    });
  });
  test('should be boolean', () {
    print(data?.questions?[0].type);
  });
}
