import 'package:bloc/bloc.dart';


enum CounterEvent {
  Increment,
  Decrement,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0); 
  //setting the initial value of counter as 0

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.Increment:
        yield state + 1;
        break;

      case CounterEvent.Decrement:
        yield state - 1;
        break;

      default:
        print('some error has occured');
    }
  }
}
