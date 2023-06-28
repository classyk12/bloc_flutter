import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_app/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  //this allows grouping of test based on feature (cubit or bloc to be tested)
  group('CounterCubit', () {
    CounterCubit? _cubit;

    //initialization happens here.its called before every test is run
    setUp(() {
      _cubit = CounterCubit();
    });

    //gets run after each test. this is used to dispose created cubit/blocs
    tearDown(() {
      _cubit!.close();
    });

    //Test package. this tests for values
    test('check if the initial value of counter state is 0', () {
      expect(_cubit!.state, const CounterState(counterValue: 0));
    });

    //blocs and cubit test. it tests for blocs and cubit outputs
    blocTest(
        'verify that the output of the increment function returns counterValue = 12 and wasIncremented = true ',
        //avails the instance of the bloc or cubit
        build: () => CounterCubit(),
        seed: () => const CounterState(counterValue: 3),

        //call the cubit methods
        act: (CounterCubit cubit) => cubit.increment(),

        //resulting or expected
        expect: () =>
            [const CounterState(counterValue: 4, isIncremented: true)]);

    //blocs and cubit test. it tests for blocs and cubit outputs
    blocTest(
        'verify that the output of the decrement function returns counterValue = -1 and wasIncremented = false ',
        //avails the instance of the bloc or cubit
        build: () => CounterCubit(),
        seed: () => const CounterState(counterValue: 9),

        //call the cubit methods
        act: (CounterCubit cubit) => cubit.decrement(),

        //resulting or expected
        expect: () =>
            [const CounterState(counterValue: 8, isIncremented: false)]);
  });
}
