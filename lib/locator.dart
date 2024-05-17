import 'package:get_it/get_it.dart';
import 'package:git_it_bloc/services/get_repositry.dart';
final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => GetRepositry());
}