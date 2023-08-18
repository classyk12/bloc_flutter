// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int? counterValue;
  final bool? isIncremented;

  const CounterState({@required this.counterValue, this.isIncremented});

  @override
  //pass the property of the state to be matched on VALUE basis
  List<Object?> get props => [counterValue, isIncremented];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'isIncremented': isIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue:
          map['counterValue'] != null ? map['counterValue'] as int : null,
      isIncremented:
          map['isIncremented'] != null ? map['isIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
