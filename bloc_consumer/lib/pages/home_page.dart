import 'package:bloc_consumer/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  CounterBloc myCounter = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Listener'),
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
            BlocConsumer(
              bloc: myCounter,
              builder: (context, state) {
                return Text('$state');
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 50),
                    content: Text('content $state')));
              },
            ),
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
