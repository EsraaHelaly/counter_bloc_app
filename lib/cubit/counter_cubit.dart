import 'package:bloc/bloc.dart';
import 'package:counter_bloc_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitState());

  int counter = 0;

  static CounterCubit get(context) => BlocProvider.of(context);

  void plus() {
    counter++;
    emit(CounterPlusState());
  }

  void minus() {
    counter--;
    emit(CounterMinusState());
  }
}
