import 'dart:async';

import 'package:basic_bloc/cubits/color/color_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // todo 4
  int incrementSize = 1;

  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;

  CounterCubit({
    required this.colorCubit,
  }) : super(
          CounterState.initial(),
        ) {
    // todo 5
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        emit(state.copyWith(counter: state.counter - 100));
        incrementSize = -100;
      }
    });
  }

  // todo 6
  void changeCounter() {
    emit(
      state.copyWith(counter: state.counter + incrementSize),
    );
  }

  // todo 7 (next main.dart)
  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
