import 'package:bloc/bloc.dart';

part 'generated_counter_state.dart';

class GeneratedCounterCubit extends Cubit<GeneratedCounterState> {
  GeneratedCounterCubit() : super(GeneratedCounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(GeneratedCounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(GeneratedCounterState(counterValue: state.counterValue - 1, wasIncremented: false));

}