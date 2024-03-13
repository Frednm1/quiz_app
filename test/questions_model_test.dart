// import 'dart:convert';

// import 'package:quiz_app/app/core/client/http_client.dart';
// import 'package:quiz_app/app/features/quiz_app/data/datasources/api_datasource.dart';
// import 'package:quiz_app/app/features/quiz_app/data/models/questions_model.dart';
// import 'package:quiz_app/app/features/quiz_app/data/repositories/questions_repositorie.dart';
// import 'package:quiz_app/app/features/quiz_app/domain/repositories/questions_repositorie.dart';
// import 'package:quiz_app/app/features/quiz_app/domain/usecases/get_questions_usecase.dart';
// import 'package:test/test.dart';

// void main() {
//   setUp(() async {
//     await GetQuestionUsecaseImpl(
//             repo: QuestionsRepositorieImpl(
//                 api: ApiDatasourceImpl(client: HttpClientImpl())))
//         .call(numberOfQuestions: 10)
//         .then((value) {});
//   });
//   test('should be boolean', () {
//     // print(data?.questions?[0].type);
//   });
// }
