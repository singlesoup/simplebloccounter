import 'package:bloc/bloc.dart';


///* This is used to observe the changes that will occur when the state changes
class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
     print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}
