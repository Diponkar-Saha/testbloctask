part of 'boolean_bloc.dart';


class BooleanState {
  final bool count;

  BooleanState({required this.count});
}

class CounterInitial extends BooleanState {


  CounterInitial() : super(count:true);
}