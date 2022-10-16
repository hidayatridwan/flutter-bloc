import 'package:bloc_access/bloc/counter_bloc.dart';
import 'package:bloc_access/pages/other_page.dart';
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
        title: Text('Provider Value'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  mycounter.decrement();
                },
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            DataCounter(),
            ElevatedButton(
                onPressed: () {
                  mycounter.increment();
                },
                child: Text('+', style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                    value: mycounter,
                    child: OtherPage(),
                  )));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}
