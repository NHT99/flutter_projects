part of 'home_bloc.dart';
class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class HomeInitial extends HomeEvent {}

class IncreaseEvent extends HomeEvent {}

class DecreaseEvent extends HomeEvent {}

class OnchangeNumberEvent extends HomeEvent {
  final int number;

  OnchangeNumberEvent({required  this.number});

  @override
  List<Object> get props => [number];
}

class AddNumberEvent extends HomeEvent {}
