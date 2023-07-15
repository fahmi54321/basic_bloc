import 'package:basic_bloc/cubits/counter/counter_bloc.dart';
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
    return BlocProvider<CounterBloc>(
      // todo 6
      create: (context) => CounterBloc(),
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
    return BlocListener<CounterBloc, CounterState>(
      // todo 7
      listener: (context, state) {
        if (state.counter == 3) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(
                      'counter is ${state.counter}',
                    ),
                  ));
        } else if (state.counter == -1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OtherPage(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            '${context.watch<CounterBloc>().state.counter}', // todo 8
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
                context
                    .read<CounterBloc>()
                    .add(IncrementCounterEvent()); // todo 9
              },
              heroTag: 'increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              onPressed: () {
                context
                    .read<CounterBloc>()
                    .add(DecrementCounterEvent()); // todo 10 (finish)
              },
              heroTag: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
