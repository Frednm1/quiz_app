import 'dart:convert';

import 'package:http/http.dart';
import 'package:quiz_app/app/core/client/http_client.dart';
import 'package:quiz_app/app/core/errors/exceptions.dart';

abstract class ApiDatasource {
  Future<Response> getQuestions({
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
  Future<Response> getQuestions({
    required int numberOfQuestions,
    String? difficulty,
    int? category,
    String? type,
  }) async {
    var data = await httpClient.get(endpoint: '/api.php', queryParameters: {
      "amount": numberOfQuestions.toString(),
      "type": type ?? '',
      "category": category?.toString() ?? '',
      "difficulty": difficulty ?? '',
    });

    if (data.statusCode == 200) {
      var result = jsonDecode(data.body);
      if (result['response_code'] != 0) {
        throw ServerException();
      } else {
        return data;
      }
    } else {
      throw ServerException();
    }
  }
}
