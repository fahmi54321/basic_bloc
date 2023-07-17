part of 'theme_cubit.dart';

enum AppTheme { light, dark }

//todo 1 (next theme_cubit.dart)

class ThemeState extends Equatable {
  final AppTheme appTheme;
  const ThemeState({this.appTheme = AppTheme.light});

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  factory ThemeState.initial() {
    return const ThemeState();
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [appTheme];
}
