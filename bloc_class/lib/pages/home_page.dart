import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_class/blocs/counter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CounterBloc counterBloc = CounterBloc(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Class'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  counterBloc.add(CounterEventDecrement());
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
                  counterBloc.add(CounterEventIncrement(context));
                },
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
