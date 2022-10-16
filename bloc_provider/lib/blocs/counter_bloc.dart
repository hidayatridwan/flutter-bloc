import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc({this.init = 0}) : super(init);

  int init;

  void decrement() => emit(state - 1);

  void increment() => emit(state + 1);

  @override
  void onChange(Change change) {
    // super.onChange(change);
    print(change);
  }
}
