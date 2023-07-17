import 'dart:math';

import 'package:basic_bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      // todo 5
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        // todo 6
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.appTheme == AppTheme.light // todo 7
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            context.read<ThemeBloc>().add(
                  // todo 8 (finish)
                  ChangeThemeEvent(
                    randInt: randInt,
                  ),
                );
          },
          child: const Text(
            'Change Theme',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
