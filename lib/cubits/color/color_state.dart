part of 'color_bloc.dart';

//todo 1 (next counter_event.dart)
class ColorState extends Equatable {
  final Color color;
  const ColorState({
    required this.color,
  });

  factory ColorState.inital() {
    return const ColorState(color: Colors.red);
  }

  @override
  bool get stringify => true;

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  List<Object> get props => [color];
}
