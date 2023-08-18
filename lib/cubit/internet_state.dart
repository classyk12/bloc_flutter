// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() => 'InternetConnected(connectivity: $connectivity)';
}

class InternetDisconnected extends InternetState {}
