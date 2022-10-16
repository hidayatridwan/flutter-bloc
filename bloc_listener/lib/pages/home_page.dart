import 'package:bloc_listener/blocs/counter_bloc.dart';
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
            BlocListener(
              bloc: myCounter,
              listenWhen: (previous, current) {
                if (current == 5) {
                  return true;
                } else {
                  return false;
                }
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('content $state')));
              },
              child: BlocBuilder<CounterBloc, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text('$state');
                },
              ),
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
