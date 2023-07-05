import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/business/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/presentation/screens/home.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _cubit = CounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
              value: _cubit,
              child: const HomeScreen(
                title: 'Home Page',
              ),
            ),
        '/second': (context) => BlocProvider.value(
              value: _cubit,
              child: const SecondScreen(
                title: 'Second Page',
              ),
            ),
        '/third': (context) => BlocProvider.value(
              value: _cubit,
              child: const ThirdScreen(
                title: 'Third Page',
              ),
            ),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  
}
