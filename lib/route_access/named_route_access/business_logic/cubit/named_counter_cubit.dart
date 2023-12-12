import 'package:bloc/bloc.dart';

part 'named_counter_state.dart';

class NamedCounterCubit extends Cubit<NamedCounterState> {
  NamedCounterCubit() : super(NamedCounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(NamedCounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(NamedCounterState(counterValue: state.counterValue - 1, wasIncremented: false));

}