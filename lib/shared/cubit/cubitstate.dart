import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {
  const CubitStates();

  @override
  List<Object> get props => [];
}

class InitialState extends CubitStates {}

class LoadedState extends CubitStates {}

class LoadingState extends CubitStates {}

class NoSuchAccount extends CubitStates {}

class FailureState extends CubitStates {}

class AlreadyInUseState extends CubitStates {}

class NoCachedDataState extends CubitStates {}
