import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_observer/blocs/counter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CounterBloc counterBloc = CounterBloc(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observer Bloc'),
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
            BlocBuilder(
                bloc: counterBloc,
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: const TextStyle(fontSize: 30),
                  );
                }),
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
