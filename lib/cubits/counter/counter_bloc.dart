import 'dart:async';

import 'package:basic_bloc/cubits/color/color_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //todo 6
  int incrementSize = 1;

  final ColorBloc colorBloc;

  late final StreamSubscription colorSubcscription;

  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    //todo 7
    colorSubcscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        add(ChangeCounterEvent());
      }
    });
    on<ChangeCounterEvent>(changeCounter);
  }

  //todo 8
  void changeCounter(ChangeCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  //todo 9 (next main.dart)

  @override
  Future<void> close() {
    colorSubcscription.cancel();
    return super.close();
  }
}
