import 'package:bloc_provider/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  BlocProvider.of<CounterBloc>(context).decrement();
                },
                icon: const Icon(Icons.remove)),
            BlocConsumer(
              bloc: BlocProvider.of<CounterBloc>(context),
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
                  BlocProvider.of<CounterBloc>(context).increment();
                },
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
