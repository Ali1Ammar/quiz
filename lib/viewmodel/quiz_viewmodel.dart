import 'package:flutter/material.dart';
import 'package:quiz/model/data/quiz.dart';
import 'package:quiz/model/service/api_service.dart';
import 'package:quiz/viewmodel/tag_viewmodel.dart';

class QuizViewModel extends ChangeNotifier {
  final ApiService apiService;
  final TagViewModel tagViewModel;
  // state
  bool isLoading = false;
  String? error;
  List<Quiz>? quizs;
  // state
  int indexOfCurrentQuiz = 0;
  Quiz get currentQuiz => quizs![indexOfCurrentQuiz];
  bool get isLastQuiz => indexOfCurrentQuiz == quizs!.length - 1;
  bool? isAnswerRight;

  QuizViewModel(this.apiService, this.tagViewModel);

  // helper function
  Future<void> loadQuiz() async {
    try {
      isLoading = true;
      notifyListeners();
      final res = await apiService.getQuizByTag(tagViewModel.selectedTags!);
      quizs = res;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void userAnswer(String e) {
    if (e == currentQuiz.correctAnswer) {
      isAnswerRight = true;
    } else {
      isAnswerRight = false;
    }
    notifyListeners();
  }

  void next() {
    indexOfCurrentQuiz++;
    isAnswerRight = null;
    notifyListeners();
  }
}
