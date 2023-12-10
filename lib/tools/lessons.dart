class TestModel {
  String question;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  String correctAnswer;

  TestModel({
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.correctAnswer,
  });
}

class LessonModel {
  String icon;
  // String bgImage;
  String name;
  List<TestModel> test;

  LessonModel({
    required this.icon,
    required this.name,
    required this.test,
  });
}