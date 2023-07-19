part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();

  @override
  List<Object> get props => [];
}

//todo 2 (next color_bloc.dart)
class ChangeColorEvent extends ColorEvent {}
