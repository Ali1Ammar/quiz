import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/data/quiz.dart';
import 'package:quiz/viewmodel/quiz_viewmodel.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final allAnswer = <String>[quiz.correctAnswer, ...quiz.incorrectAnswers]
      ..shuffle();
    return Card(
      child: Column(
        children: [
          Text(quiz.question),
          ...allAnswer.map((e) => ListTile(
                title: Text(e),
                onTap: () {
                  //

                  context.read<QuizViewModel>().userAnswer(e);
                },
              ))
        ],
      ),
    );
  }
}
