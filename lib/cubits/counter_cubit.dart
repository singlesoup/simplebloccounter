import 'package:bloc/bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));
  //setting the initial value of state as 0

  ///? This doesn't need "mapEventtoState" since it uses "emit" , which
  ///? can only be used inside cubit and is private

  void increment() => emit(
        CounterState(
          counterValue: state.counterValue + 1,
          isIncremented: true,
        ),
      );
  void decrement() => emit(
        CounterState(
          counterValue: state.counterValue - 1,
          isIncremented: false,
        ),
      );
}
