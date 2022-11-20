import 'package:flutter/material.dart';
import 'package:quiz/model/service/api_service.dart';

class TagViewModel extends ChangeNotifier {
  final ApiService apiService;

  TagViewModel(this.apiService);
  // state
  bool isLoading = false;
  String? error;
  List<String>? tags;
  String? selectedTags;

  pressTag(String tag) {
    selectedTags = tag;
  }

  // helper function
  Future<void> loadTags() async {
    try {
      isLoading = true;
      notifyListeners();
      final res = await apiService.getTags();
      tags = res.tag;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }
}
