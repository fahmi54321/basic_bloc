import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<ChangeCounterEvent>(changeCounter);
  }

  //todo 1 (next counter_event.dart)

  void changeCounter(ChangeCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + event.incrementSize));
  }
}
