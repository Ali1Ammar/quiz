import 'package:dio/dio.dart';
import 'package:quiz/model/data/quiz.dart';
import 'package:quiz/model/data/tag.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<TagRespone> getTags() async {
    final res = await dio.get<List<dynamic>>('/tags');

    if (res.data == null || res.data!.isEmpty) {
      throw Exception("No Data");
    }
    return TagRespone(res.data!.cast());
  }

  Future<List<Quiz>> getQuizByTag(String tag, [int limit = 10]) async {
    final res = await dio.get<List<dynamic>>('/questions',
        queryParameters: {"limit": limit, "tags": tag});

    if (res.data == null || res.data!.isEmpty) {
      throw Exception("No Data");
    }
    return res.data!.map((e) => Quiz.fromJson((e as Map).cast())).toList();
  }
}
