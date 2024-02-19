import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool isDarkMode = false})
      : super(ThemeState(isDarkMode: isDarkMode));
}
