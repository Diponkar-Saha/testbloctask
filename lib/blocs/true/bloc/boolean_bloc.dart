import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boolean_event.dart';
part 'boolean_state.dart';

class BooleanBloc extends Bloc<BooleanEvent, BooleanState> {
  BooleanBloc() : super(CounterInitial()) {
    on<True>((event, emit) {
      return emit(BooleanState(count:true));
    });
    on<False>((event, emit) {
      return emit(BooleanState(count: false));
    });
  }
}