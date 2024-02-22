import 'package:bloc_rick_morty/presentation/bloc/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(ThemeCubit());
}
