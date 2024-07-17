import 'dart:convert';
import 'package:quiz_app/app/core/client/http_client.dart';
import 'package:quiz_app/app/layers/data/model/questions_model.dart';
import 'package:quiz_app/app/layers/domain/entity/question_entity.dart';

abstract class ApiDatasource {
  Future<List<Question>> getQuestions({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  });
}

class ApiDatasourceImpl implements ApiDatasource {
  final HttpClient httpClient;
  ApiDatasourceImpl({required this.httpClient});

  @override
  Future<List<Question>> getQuestions({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  }) async {
    var response = await httpClient.get(endpoint: '/api.php', queryParameters: {
      "amount": numberOfQuestions.toString(),
      "type": type ?? '',
      "category": category?.toString() ?? '',
      "difficulty": difficulty ?? '',
    });

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['response_code'] != 0) {
        throw Exception('Get question error');
      } else {
        List<Question> questions = [];
        for (var question in result['results']) {
          questions.add(QuestionModel.fromJson(question));
        }
        return questions;
      }
    } else {
      throw Exception('Get question error');
    }
  }
}
