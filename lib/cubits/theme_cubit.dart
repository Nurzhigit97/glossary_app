import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit будет получать свойства из SettingState
class ThemeCubit extends Cubit<bool> {
  // с помощью super получаем доступ к isToggle и устанавливаем зн. по умолчанию true
  ThemeCubit() : super(false);
  bool isDark = false;
  // Method для переключения темы
  void toggleTheme({required bool value}) {
    // переключаем зн. в class SettingState isToggle на false etc
    final updateToggleState = isDark = !value;
    // обновляет зн.
    emit(updateToggleState);
  }
}
