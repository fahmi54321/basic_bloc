import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          CounterState.initial(), // todo 2
        );

  // todo 3
  void increment() {
    emit(
      state.copyWith(
        counter: state.counter + 1,
      ),
    );
  }

  // todo 4 (finish)
  void decrement() {
    emit(
      state.copyWith(
        counter: state.counter - 1,
      ),
    );
  }
}
