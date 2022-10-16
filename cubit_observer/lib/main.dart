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
                  return Text(
                      'current: ${myCounter.current}, live: ${snapshot.data}, next: ${myCounter.next}');
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
  int? current;
  int? next;

  void decrement() => emit(state - 1);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
    print(stackTrace);
  }
}
