import 'package:bloc_access/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc mycounter = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc,int>(
          bloc: mycounter,
          builder: (context,state){
            return Text(
              '$state',
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
    );
  }
}
