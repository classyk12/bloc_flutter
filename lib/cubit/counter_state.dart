part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int? counterValue;
  final bool? isIncremented;

  const CounterState({@required this.counterValue, this.isIncremented});

  @override
  //pass the property of the state to be matched on VALUE basis
  List<Object?> get props => [counterValue, isIncremented];
}
