// import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc_app/constants/enums.dart';
// import 'package:flutter_bloc_app/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;
  // StreamSubscription? internetCubitSubscription;
  CounterCubit() : super(const CounterState(counterValue: 0)) {
    //  monitorInternetConnection();
  }

  // void monitorInternetConnection() {
  //   internetCubitSubscription = internetCubit.stream.listen((event) {
  //     if (event is InternetConnected &&
  //         event.connectivity == ConnectivityType.wifi) {
  //       increment();
  //     } else if (event is InternetConnected &&
  //         event.connectivity == ConnectivityType.mobile) {
  //       decrement();
  //     } else {}
  //   });
  // }

  void increment() => emit(
      CounterState(counterValue: state.counterValue! + 1, isIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue! - 1, isIncremented: false));

  // @override
  // Future<void> close() async {
  //   internetCubitSubscription!.cancel();
  //   return super.close();
  // }
}
