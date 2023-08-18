// import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:flutter_bloc_app/constants/enums.dart';
// import 'package:flutter_bloc_app/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
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

  @override
  //* this is called everytime the state needs to be retrieved
  CounterState? fromJson(Map<String, dynamic> json) {
    //onError(error, stackTrace)
    return CounterState.fromMap(json);
  }

  @override
  //* this is called for every state change in the application
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }

//* this is used to track all the changes in the cubit
  // @override
  // void onChange(Change<CounterState> change) {
  //   debugPrint(change.toString());
  //   super.onChange(change);
  // }
}
