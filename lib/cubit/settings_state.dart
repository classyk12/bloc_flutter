// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool? appNotifications;
  final bool? emailNotifications;

  const SettingsState({this.appNotifications, this.emailNotifications});

  @override
  //
  List<Object> get props => [appNotifications!, emailNotifications!];

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appNotifications': appNotifications,
      'emailNotifications': emailNotifications,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotifications: map['appNotifications'] != null
          ? map['appNotifications'] as bool
          : null,
      emailNotifications: map['emailNotifications'] != null
          ? map['emailNotifications'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) =>
      SettingsState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
