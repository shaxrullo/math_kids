class Test {
  int  id;
  String question;
  String option1;
  String option2;
  String option3;
  String correctAnswer;
  int level;
  String category;
  
  Test({
    required this.id,
    required this.category,
    required this.correctAnswer,
    required this.level,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.question,
  });
  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: json['id'],
      question: json['question'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      correctAnswer: json['correct_answer'],
      level: json['level'],
      category: json['category'],
    );
  }
}
