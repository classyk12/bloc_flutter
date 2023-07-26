import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/cubit/internet_cubit.dart';
import 'package:flutter_bloc_app/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity? connectivity;
  final AppRouter? appRouter;

  const MyApp({Key? key, this.connectivity, this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity!)),
        BlocProvider<CounterCubit>(
            create: (context) =>
                CounterCubit(BlocProvider.of<InternetCubit>(context))),
      ],
      child: MaterialApp(
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
        onGenerateRoute: appRouter!.onGenerateRoute,

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _router.dispose();
  // }
}
