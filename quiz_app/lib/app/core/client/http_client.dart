import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<Response> get({
    required String endpoint,
    Map<String, String>? header,
    Map<String, String>? queryParameters,
  });
}

class HttpClientImpl implements HttpClient {
  final String baseUrl = "opentdb.com";

  static final HttpClientImpl _instance = HttpClientImpl._internal();

  factory HttpClientImpl() {
    return _instance;
  }

  HttpClientImpl._internal();

  @override
  Future<Response> get({
    required String endpoint,
    Map<String, String>? header,
    Map<String, String>? queryParameters,
  }) async {
    var url = Uri.https(baseUrl, endpoint, queryParameters ?? {});
    return await http.get(
      url,
      headers: header ?? {},
    );
  }
}
