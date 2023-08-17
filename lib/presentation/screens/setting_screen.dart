import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/settings_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          var snack = SnackBar(
            content: Text(
                'App : ${state.appNotifications.toString().toUpperCase()} - Email : ${state.emailNotifications.toString().toUpperCase()}'),
            duration: const Duration(seconds: 1),
          );

          ScaffoldMessenger.of(context).showSnackBar(snack);
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('App Notifications'),
                Switch(
                    value: state.appNotifications!,
                    onChanged: (val) {
                      context.read<SettingsCubit>().toggleAppNotifications(val);
                    }),
              ]),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Email Notifications'),
                Switch(
                    value: state.emailNotifications!,
                    onChanged: (val) {
                      context
                          .read<SettingsCubit>()
                          .toggleEmailNotifications(val);
                    }),
              ])
            ],
          );
        },
      ),
    );
  }
}
