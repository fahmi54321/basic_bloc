part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

//todo 2
class IncrementCounterEvent extends CounterEvent {}

//todo 3 (next counter_bloc)
class DecrementCounterEvent extends CounterEvent {}
