
import 'package:dio/dio.dart';
import 'package:git_it_bloc/services/model_class.dart';
class GetRepositry {
  Dio dio = Dio();

  Future<List<GetItModelClass>> fetchData() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/comments?postId=1');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => GetItModelClass.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
}}}
