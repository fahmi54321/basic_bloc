// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'theme_bloc.dart';

// todo 1 (next theme_event.dart)

enum AppTheme { light, dark }

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
