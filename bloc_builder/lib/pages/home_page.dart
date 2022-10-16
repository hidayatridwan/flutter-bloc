import 'package:bloc_builder/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  CounterBloc myCounter = CounterBloc(init: 2);

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
            // StreamBuilder(
            //     initialData: myCounter.init,
            //     stream: myCounter.stream,
            //     builder: (context, snapshot) {
            //       return Text('${snapshot.data}');
            //     }),
            BlocBuilder<CounterBloc,int>(
              bloc: myCounter,
              buildWhen: (previous, current) {
                print(previous);
                print(current);
                if (current>5){
                  return true;
                }else{
                  return false;
                }
              },
              builder: (context, state) {
                return Text('$state');
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
