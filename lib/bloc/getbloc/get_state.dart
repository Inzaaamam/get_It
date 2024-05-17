import 'package:git_it_bloc/services/model_class.dart';
import 'package:git_it_bloc/utails/uatil.dart';

class GetState {
  final PostStatus status;
  final List<GetItModelClass>? posts;
  final String? error;
 GetState({this.status = PostStatus.loading, this.posts = const <GetItModelClass>[], this.error});
  GetState copyWith({
    PostStatus? status,
    List<GetItModelClass>? posts,
    String? error,
  }) {
    return GetState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,);
}
}