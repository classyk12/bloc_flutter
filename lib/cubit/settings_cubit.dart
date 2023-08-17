import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
            appNotifications: false, emailNotifications: false));

  void toggleAppNotifications(bool value) =>
      emit(state.copyWith(appNotifications: value));

  void toggleEmailNotifications(bool value) =>
      emit(state.copyWith(emailNotifications: value));
}
