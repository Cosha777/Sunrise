import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sunrise/data/api/api_util.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class HomeBloc extends Bloc<MyEvent, MyState> {
  ApiUtil dayRepository;

  HomeBloc(this.dayRepository) : super(EmptyState()) {
    on<GetInfoEvent>((event, emit) async {
      emit(Loading());
      try {
        final day = await dayRepository.getDay(
            latitude: double.parse(event.lat),
            longitude: double.parse(event.lng));
        emit(Loaded(day: day));
      } catch (e) {
        emit(Error('Проверте введенные данные'));
      }
    });
  }
}
