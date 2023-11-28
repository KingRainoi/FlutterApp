import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(bool initialIsDark) : super(ThemeInitial()) {
    _isDark = initialIsDark;
  }

  bool _isDark = false;
  bool get isDark => _isDark;

  Future<void> loadInitialTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark');

    if (isDark != null) {
      _isDark = isDark;
      print("soy tema oscuro? $isDark");
      emit(ThemeChanged());
    }
  }

  void changeTheme() {
    _isDark = !_isDark;
    emit(ThemeChanged());
  }
}
