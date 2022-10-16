import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterEvent {}

class CounterEventIncrement extends CounterEvent {
  CounterEventIncrement(this.context);

  BuildContext context;
}

class CounterEventDecrement extends CounterEvent {}

class CounterBloc extends Bloc {
  CounterBloc(int initial) : super(initial) {
    on<CounterEventIncrement>((event, emit) {
      emit(state + 1);

      if (state > 5) {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(const SnackBar(content: Text('Lebih dari 5')));
      }
    });
    on<CounterEventDecrement>((event, emit) {
      emit(state - 1);
    });
  }

  @override
  void onChange(Change change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }

  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }
}
