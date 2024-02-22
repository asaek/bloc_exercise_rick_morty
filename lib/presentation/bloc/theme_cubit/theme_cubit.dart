import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool isDarkMode = false})
      : super(ThemeState(isDarkMode: isDarkMode));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setThemeDark() {
    emit(const ThemeState(isDarkMode: true));
  }

  void setThemeLight() {
    emit(const ThemeState(isDarkMode: false));
  }
}
