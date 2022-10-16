import 'package:bloc_provider_value/bloc/counter_bloc.dart';
import 'package:bloc_provider_value/pages/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc mycounter = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Value'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  mycounter.decrement();
                },
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            const DataCounter(),
            ElevatedButton(
                onPressed: () {
                  mycounter.increment();
                },
                child: const Text('+', style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                    value: mycounter,
                    child: const OtherPage(),
                  )));
        },
        child: const Icon(Icons.forward),
      ),
    );
  }
}
