import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/business/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/presentation/screens/home.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/third_screen.dart';

class AppRouter {
  final CounterCubit _cubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _cubit,
                  child: const HomeScreen(
                    title: 'Home Page',
                  ),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _cubit,
                  child: const SecondScreen(
                    title: 'Second Page',
                  ),
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _cubit,
                  child: const ThirdScreen(
                    title: 'Third Page',
                  ),
                ));

      default:
        return null;
    }
  }

  void dispose() {
    _cubit.close();
  }
}
