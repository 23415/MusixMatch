import 'dart:async';

import 'package:asssignment/bloc/musix_match_event.dart';
import 'package:asssignment/models/api_request.dart';
import 'package:asssignment/models/lyrics.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

import '../models/tracks.dart';

part 'musix_match_state.dart';

class MusixMatchBloc extends Bloc<MusixMatchEvent, MusixMatchState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  MusixMatchBloc() : super(LoadingState()) {
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          isInternetAvailable = true;
          if (state is NoInternetState) {
            emit(LoadingState());
          }
          emit(state);
        } else {
          isInternetAvailable = false;
          emit(NoInternetState());
        }
      },
    );
    on<MusixMatchInitialEvent>(_handleLoadData, transformer: sequential());
    on<GetTrackDataEvent>(_handleTrackData, transformer: sequential());
    on<InternetLostEvent>(_handleInternetLost, transformer: sequential());
  }
  final ApiManager apiManager = ApiManager();
  bool isInternetAvailable = true;

  void _handleInternetLost(
      InternetLostEvent event, Emitter<MusixMatchState> emit) {
    isInternetAvailable = false;
    emit(NoInternetState());
  }

  void _handleLoadData(
      MusixMatchEvent event, Emitter<MusixMatchState> emit) async {
    if (!isInternetAvailable) {
      emit(NoInternetState());
      return;
    }
    List<Tracks> tracks = await apiManager.getTracks();
    emit(MusixMatchInitial(tracks));
  }

  void _handleTrackData(
      GetTrackDataEvent event, Emitter<MusixMatchState> emit) async {
    if (!isInternetAvailable) {
      emit(NoInternetState());
      return;
    }
    Tracks? trackData = await apiManager.getTrackData(event.trackId);
    Lyrics? lyrics = await apiManager.getLyrics(event.trackId);
    if (trackData == null || lyrics == null) {
      emit(NoInternetState());
    }
    emit(
      TrackDataState(
        trackData: trackData!,
        lyrics: lyrics!,
      ),
    );
  }
}
