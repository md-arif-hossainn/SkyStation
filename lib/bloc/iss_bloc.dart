import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_station/repository/iss_repository.dart';

import '../data/response/api_response.dart';
import 'iss_event.dart';
import 'iss_state.dart';


class IssBloc extends Bloc<IssEvent, IssState> {
  final IssRepository issRepository;
  Timer? timer;

  IssBloc({required this.issRepository})
      : super(IssState(issData: ApiResponse.loading(), secondsRemaining: 60, locationName: ApiResponse.loading())) {
    on<IssDataFetched>(_fetchApiData);
    on<CountdownTicked>(_onCountdownTicked);
    on<LocationFetched>(_fetchLocationName);


    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(CountdownTicked());
    });
  }

  Future<void> _fetchApiData(IssDataFetched event, Emitter<IssState> emit) async {
    emit(state.copyWith(issData: ApiResponse.loading()));
    await issRepository.fetchData().then((response) {
      emit(state.copyWith(
        issData: ApiResponse.completed(response),
        secondsRemaining: 60, // Reset countdown
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        issData: ApiResponse.error(error.toString()),
        secondsRemaining: 60, // Reset countdown
      ));
    });
  }

  Future<void> _fetchLocationName(LocationFetched event, Emitter<IssState> emit) async {
    emit(state.copyWith(locationName: ApiResponse.loading()));
      await issRepository.fetchLocationName(event.latitude, event.longitude).then((response) {
        emit(state.copyWith(
          locationName: ApiResponse.completed(response),
          secondsRemaining: 60,
        ));
      }).onError((error, stackTrace) {
        emit(state.copyWith(
          issData: ApiResponse.error(error.toString()),
          secondsRemaining: 60,
        ));
      });
  }

  void _onCountdownTicked(CountdownTicked event, Emitter<IssState> emit) {
    if (state.secondsRemaining > 0) {
      emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
    } else {
      add(IssDataFetched());
    }
  }


  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
