import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc {
  CounterBloc(int initial) : super(initial) {
    on((event, emit) {
      if (event == CounterEvent.increment) {
        emit(state + 1);
      } else {
        emit(state - 1);
      }
    });
  }
}
