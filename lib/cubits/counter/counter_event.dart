part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

//todo 5 (next counter_bloc.dart)

class ChangeCounterEvent extends CounterEvent {}
