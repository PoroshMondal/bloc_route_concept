import 'package:bloc/bloc.dart';

part 'global_counter_state.dart';

class GlobalCounterCubit extends Cubit<GlobalCounterState> {
  GlobalCounterCubit() : super(GlobalCounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(GlobalCounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(GlobalCounterState(counterValue: state.counterValue - 1, wasIncremented: false));

}