import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(result: [], input: 0)) {
    on<HomeInitial>(_homeInitial);
    on<OnchangeNumberEvent>(_onchangeNumber);
    on<IncreaseEvent>(_increaseNumber);
    on<DecreaseEvent>(_decreaseNumber);
    on<AddNumberEvent>(_addNumber);
  }

  void _homeInitial(HomeInitial event, Emitter<HomeState> emit) {
    emit(state.copyWith(input: 0, result: []));
  }

  void _onchangeNumber(OnchangeNumberEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(input: event.number));
  }

  void _increaseNumber(IncreaseEvent event, Emitter<HomeState> emit) {
    int inputValue = state.input! + 1;
    emit(state.copyWith(input: inputValue));
  }

  void _decreaseNumber(DecreaseEvent event, Emitter<HomeState> emit) {
    int inputValue = state.input! - 1;
    emit(state.copyWith(input: inputValue));
  }

  void _addNumber(AddNumberEvent event, Emitter<HomeState> emit) {
    final curResult = state.result;
    curResult!.add(state.input!);
    emit(state.copyWith(input: 0, result: curResult));
  }
}
