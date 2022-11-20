import 'package:json_annotation/json_annotation.dart';

part "quiz.g.dart";

@JsonSerializable()
class Quiz {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  // @JsonKey(name: "correct_answer")
  final String correctAnswer;
  // @JsonKey(name: "incorrect_answers")
  final List<String> incorrectAnswers;
  Quiz(this.category, this.type, this.difficulty, this.question,
      this.correctAnswer, this.incorrectAnswers);

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}
