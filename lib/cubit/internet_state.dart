part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

//initial state of the cubit
class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectivityType connectivity;

  const InternetConnected(this.connectivity);
}

class InternetDisconnected extends InternetState {}
