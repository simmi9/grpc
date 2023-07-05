import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FloaterEvent {}

class Add extends FloaterEvent {
  int value;
  Add(this.value);
}

class Created extends FloaterEvent {
  int value;
  Created(this.value);
}

class FloaterBloc extends Bloc<FloaterEvent, int> {
  /// {@macro counter_bloc}
  FloaterBloc() : super(0) {
    on<Add>((event, emit) => emit(1));
    on<Created>((event, emit) => emit(0));
  }
}
/*
class FloaterBloc extends Bloc<FloaterEvent, int> {
  FloaterBloc(super.initialState);

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int currentState, FloaterEvent event) async* {
    if (event is Add) {
      yield 1;
    } else if (event is Created) {
      yield 0;
    }
  }
}

*/
