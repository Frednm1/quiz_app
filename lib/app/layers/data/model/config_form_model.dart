class ConfigFormModel {
  int numberOfQuestions;
  int? category;
  String? type;
  String? difficulty;

  ConfigFormModel({
    required this.numberOfQuestions,
    this.category,
    this.type,
    this.difficulty,
  });
}
