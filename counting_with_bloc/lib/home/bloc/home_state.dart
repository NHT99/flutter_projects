part of 'home_bloc.dart';

final class HomeState {
  List<int>? result;
  int? input;

  HomeState({this.result, this.input});

  HomeState copyWith({List<int>? result, int? input}) {
    return HomeState(result: result ?? this.result, input: input ?? this.input);
  }
}
