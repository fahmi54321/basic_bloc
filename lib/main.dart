import 'package:basic_bloc/cubits/color/color_bloc.dart';
import 'package:basic_bloc/cubits/counter/counter_bloc.dart';
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
    //todo 10
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(
            colorBloc: context.read<ColorBloc>(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color, //todo 11
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //todo 12
                context.read<ColorBloc>().add(ChangeColorEvent());
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
              '${context.watch<CounterBloc>().state.counter}', //todo 13
              style: const TextStyle(
                fontSize: 52.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //todo 14 (finish)
                context.read<CounterBloc>().add(
                      ChangeCounterEvent(),
                    );
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
