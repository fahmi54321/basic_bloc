import 'dart:developer';

import 'package:basic_bloc/cubits/counter/counter_cubit.dart';
import 'package:basic_bloc/other_page.dart';
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
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.counter == 3) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    'counter is ${context.watch<CounterCubit>().state.counter}', //todo 1
                  ),
                );
              });
        } else if (state.counter == -1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OtherPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(
              '${context.watch<CounterCubit>().state.counter}', // todo 2
              style: const TextStyle(
                fontSize: 52.0,
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment(); // todo 3
                },
                heroTag: 'increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10.0),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement(); // todo 4
                },
                heroTag: 'decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
