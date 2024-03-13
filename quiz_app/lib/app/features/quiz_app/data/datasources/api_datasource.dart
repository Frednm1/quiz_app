import 'dart:convert';

import 'package:http/http.dart';
import 'package:quiz_app/app/core/client/http_client.dart';
import 'package:quiz_app/app/core/errors/exceptions.dart';

abstract class ApiDatasource {
  Future<Response> getQuestions({required int numberOfQuestions});
}

class ApiDatasourceImpl implements ApiDatasource {
  final HttpClient client;
  ApiDatasourceImpl(this.client);
  @override
  Future<Response> getQuestions({required int numberOfQuestions}) async {
    var data = await client.get(endpoint: '/api.php', queryParameters: {
      "amount": numberOfQuestions.toString(),
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
