import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quiz/viewmodel/quiz_viewmodel.dart';
import 'package:quiz/viewmodel/tag_viewmodel.dart';
import 'package:quiz/widget/quiz_card.dart';

class QuizPage extends StatelessWidget {
  // final String selectedTag;
  const QuizPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectetTag = context.read<TagViewModel>().selectedTags!;
    final quizViewModel = context.watch<QuizViewModel>();
    Widget body;
    if (quizViewModel.isLoading) {
      body = const CircularProgressIndicator();
    } else if (quizViewModel.error != null) {
      body = Text(quizViewModel.error!);
    } else if (quizViewModel.isAnswerRight != null) {
      body = Column(
        children: [
          Text("your answer ${quizViewModel.isAnswerRight}"),
          if (quizViewModel.isLastQuiz)
            Text("end")
          else
            TextButton(
                onPressed: () {
                  quizViewModel.next();
                },
                child: const Text("next"))
        ],
      );
    } else {
      body = QuizCard(
        quiz: quizViewModel.currentQuiz,
      );
    }
    var appBar2 = AppBar(
      title: Text(selectetTag),
    );
    return Scaffold(
      appBar: appBar2,
      body: body,
    );
  }
}
