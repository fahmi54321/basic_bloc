import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState.initial(),
        ) {
    on<ChangeThemeEvent>(_changeThemeEvent);
  }

  // todo 4 (next main.dart)
  void _changeThemeEvent(ChangeThemeEvent event, Emitter<ThemeState> emit) {
    if (event.randInt % 2 == 0) {
      emit(state.copyWith(appTheme: AppTheme.light));
    } else {
      emit(state.copyWith(appTheme: AppTheme.dark));
    }
  }
}
