import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    int newCount = state.counter + 1;
    final newState = state.copyWith(counter: newCount);
    emit(newState);
  }

  void decrement() {
    int newCount = state.counter - 1;
    final newState = state.copyWith(counter: newCount);
    emit(newState);
  }
}
