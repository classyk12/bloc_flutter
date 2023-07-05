import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/': (context) => BlocProvider.value(
      //         value: _cubit,
      //         child: const HomeScreen(
      //           title: 'Home Page',
      //         ),
      //       ),
      //   '/second': (context) => BlocProvider.value(
      //         value: _cubit,
      //         child: const SecondScreen(
      //           title: 'Second Page',
      //         ),
      //       ),
      //   '/third': (context) => BlocProvider.value(
      //         value: _cubit,
      //         child: const ThirdScreen(
      //           title: 'Third Page',
      //         ),
      //       ),
      // },
      onGenerateRoute: _router.onGenerateRoute,

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
