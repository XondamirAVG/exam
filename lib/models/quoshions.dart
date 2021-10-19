// To parse this JSON data, do
//
//     final quoshions = quoshionsFromJson(jsonString);

import 'dart:convert';

Quoshions quoshionsFromJson(String str) => Quoshions.fromJson(json.decode(str));

String quoshionsToJson(Quoshions data) => json.encode(data.toJson());

class Quoshions {
  Quoshions({
    this.responseCode,
    this.results,
  });

  int? responseCode;
  List<Result>? results;

  factory Quoshions.fromJson(Map<String, dynamic> json) => Quoshions(
    responseCode: json["response_code"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"],
    type: json["type"],
    difficulty: json["difficulty"],
    question: json["question"],
    correctAnswer: json["correct_answer"],
    incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "type": type,
    "difficulty": difficulty,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": List<dynamic>.from(incorrectAnswers!.map((x) => x)),
  };
}
