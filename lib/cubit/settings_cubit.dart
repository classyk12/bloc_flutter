import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit()
      : super(const SettingsState(
            appNotifications: false, emailNotifications: false));

  void toggleAppNotifications(bool value) =>
      emit(state.copyWith(appNotifications: value));

  void toggleEmailNotifications(bool value) =>
      emit(state.copyWith(emailNotifications: value));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
