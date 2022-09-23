part of 'boolean_bloc.dart';

@immutable
abstract class BooleanEvent {}
class True extends BooleanEvent{}
class False extends BooleanEvent{}