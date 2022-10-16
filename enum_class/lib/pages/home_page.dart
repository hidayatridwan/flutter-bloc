import 'package:enum_class/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enum Class'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  counterBloc.add(CounterEvent.decrement);
                },
                icon: const Icon(Icons.remove)),
            BlocBuilder<CounterBloc, int>(
              bloc: counterBloc,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  counterBloc.add(CounterEvent.increment);
                },
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
