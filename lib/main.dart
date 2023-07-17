import 'dart:math';

import 'package:basic_bloc/cubits/color/color_cubit.dart';
import 'package:basic_bloc/cubits/counter/counter_cubit.dart';
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
    //todo 8
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            colorCubit: context.read<ColorCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color, // todo 9
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<ColorCubit>().changeColor(); // todo 10
              },
              child: const Text(
                'Change Color',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              '${context.watch<CounterCubit>().state.counter}', // todo 11
              style: const TextStyle(
                fontSize: 52.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                context
                    .read<CounterCubit>()
                    .changeCounter(); // todo 12 (finish)
              },
              child: const Text(
                'Increment Counter',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
