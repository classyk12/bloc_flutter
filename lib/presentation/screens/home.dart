import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
import 'package:flutter_bloc_app/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return

        // BlocListener<InternetCubit, InternetState>(
        //   listener: (context, state) {
        //     if (state is InternetConnected &&
        //         state.connectivity == ConnectivityType.mobile) {
        //       BlocProvider.of<CounterCubit>(context).increment();
        //     } else if (state is InternetConnected &&
        //         state.connectivity == ConnectivityType.wifi) {
        //       BlocProvider.of<CounterCubit>(context).decrement();
        //     }
        //   },
        //   child:

        Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.green,
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            heroTag: '45',
            backgroundColor: Colors.red,
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(builder: ((context, state) {
              return Column(
                children: [
                  Text(state.counterValue!.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  const SizedBox(height: 20),
                ],
              );
            })),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              var internetState = context.watch<InternetCubit>().state;
              var counterState = context.watch<CounterCubit>().state;

              if (internetState is InternetConnected &&
                  internetState.connectivity == ConnectivityType.mobile) {
                return Text(
                    'Counter - ${counterState.counterValue.toString()} >> Internet - Mobile',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green));
              } else if (internetState is InternetConnected &&
                  internetState.connectivity == ConnectivityType.wifi) {
                return Text(
                    'Counter - ${counterState.counterValue.toString()} >> Internet - WIFI',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue));
              } else if (internetState is InternetDisconnected) {
                return const Text('Disconnected',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red));
              } else {
                return const CircularProgressIndicator.adaptive();
              }
            }),
            const SizedBox(height: 50),

            BlocBuilder<InternetCubit, InternetState>(
                builder: ((context, state) {
              if (state is InternetConnected &&
                  state.connectivity == ConnectivityType.mobile) {
                return const Text('Mobile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green));
              } else if (state is InternetConnected &&
                  state.connectivity == ConnectivityType.wifi) {
                return const Text('Wifi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue));
              } else if (state is InternetDisconnected) {
                return const Text('Disconnected',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red));
              } else {
                return const CircularProgressIndicator.adaptive();
              }
            })),

            // BlocConsumer<CounterCubit, CounterState>(
            //     listener: (context, state) {
            //   if (state.isIncremented == true) {
            //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         duration: Duration(seconds: 1),
            //         content: Text("Increment")));
            //   } else {
            //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         duration: Duration(seconds: 1),
            //         content: Text("Decrement")));
            //   }
            // }, builder: (context, state) {
            //   return Text(
            //     state.counterValue.toString(),
            //     style: Theme.of(context).textTheme.bodyMedium,
            //   );
            // }),
            const SizedBox(height: 20),
            InkWell(
                onTap: () {
                  //pass cubit/bloc to next screen

                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Go to Screen 2')),
          ],
        ),
      ),
    );
  }
}
