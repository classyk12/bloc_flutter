import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
              if (state.isIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("Increment")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("Decrement")));
              }
            }, builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
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
    );
  }
}
