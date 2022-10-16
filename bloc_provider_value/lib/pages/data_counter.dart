import 'package:bloc_provider_value/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCounter extends StatelessWidget {
  const DataCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc mycounter = context.read<CounterBloc>();
    return BlocBuilder<CounterBloc, int>(
        bloc: mycounter,
        builder: (context, state) {
          return Text('$state', style: TextStyle(fontSize: 25));
        });
  }
}
