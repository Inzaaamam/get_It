import 'package:bloc/bloc.dart';
import 'package:git_it_bloc/bloc/getbloc/get_event.dart';
import 'package:git_it_bloc/bloc/getbloc/get_state.dart';
import 'package:git_it_bloc/services/get_repositry.dart';
import 'package:git_it_bloc/services/model_class.dart';
import 'package:git_it_bloc/utails/uatil.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  GetBloc() : super(GetState()) {
    on<FatchedData>(fatchData);
  }
  final GetRepositry  dioRepositry = GetRepositry ();
  void fatchData(FatchedData event, Emitter<GetState> emit) async {
    try {
      final List<GetItModelClass> data = await dioRepositry.fetchData();
      emit(GetState(status: PostStatus.sucess, posts: data));
    // ignore: unused_catch_stack
    } catch (error, stackTrace) {
      emit(GetState(status: PostStatus.fail, error: error.toString()));
    }
  }
}