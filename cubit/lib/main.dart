import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  CounterCubit myCounter = CounterCubit(initialData: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  myCounter.decrement();
                },
                icon: const Icon(Icons.remove)),
            StreamBuilder(
                initialData: myCounter.initialData,
                stream: myCounter.stream,
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                }),
            IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void decrement() => emit(state - 1);

  void increment() => emit(state + 1);
}
