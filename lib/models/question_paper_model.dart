// To parse this JSON data, do
//
//     final questionPaperModel = questionPaperModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

QuestionPaperModel questionPaperModelFromJson(String str) =>
    QuestionPaperModel.fromJson(json.decode(str));

String questionPaperModelToJson(QuestionPaperModel data) =>
    json.encode(data.toJson());

class QuestionPaperModel {
  QuestionPaperModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.timeSeconds,
    this.questions,
    required this.questionCount,
  });

  String id;
  String title;
  String imageUrl;
  String description;
  int timeSeconds, questionCount;
  List<Question>? questions;

//this is used for assets json file
  factory QuestionPaperModel.fromJson(Map<String, dynamic> json) =>
      QuestionPaperModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["Description"],
        timeSeconds: json["time_seconds"],
        questionCount: 0,
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );
//firebase
  factory QuestionPaperModel.fromSnapshots(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      QuestionPaperModel(
        // id: json["id"],
        id: json.id,
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["description"],
        timeSeconds: json["time_second"],
        questionCount: json["question_count"] as int,
        questions: [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "Description": description,
        "time_seconds": timeSeconds,
        "questions": List<dynamic>.from(questions ?? [].map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
  });

  String id;
  String question;
  List<Answer> answers;
  CorrectAnswer? correctAnswer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        correctAnswer: correctAnswerValues.map[json["correct_answer"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "correct_answer": correctAnswerValues.reverse[correctAnswer],
      };
}

class Answer {
  Answer({
    this.identifier,
    this.answer,
  });

  CorrectAnswer? identifier;
  String? answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        identifier: correctAnswerValues.map[json["identifier"]],
        answer: json["Answer"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": correctAnswerValues.reverse[identifier],
        "Answer": answer,
      };
}

enum CorrectAnswer { A, B, C, D }

final correctAnswerValues = EnumValues({
  "A": CorrectAnswer.A,
  "B": CorrectAnswer.B,
  "C": CorrectAnswer.C,
  "D": CorrectAnswer.D
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
