// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  //initial state of the cubic       //sets the initial state of the cubit
  InternetCubit(this.connectivity) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
     connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectivityType.wifi);
      } else if (result == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectivityType.mobile);
      } else {
        emitInternetDisConnected();
      }
    });
  }
//TODO:
  void emitInternetConnected(ConnectivityType _connectionType) =>
      emit(InternetConnected(_connectionType));

  void emitInternetDisConnected() => emit(InternetDisconnected());

  Future dispose() async {
    connectivityStreamSubscription!.cancel();
  }
}
