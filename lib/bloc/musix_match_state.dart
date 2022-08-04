part of 'musix_match_bloc.dart';

@immutable
abstract class MusixMatchState {}

class MusixMatchInitial extends MusixMatchState {
  final List<Tracks> tracks;
  MusixMatchInitial(this.tracks);
}

class TrackDataState extends MusixMatchState {
  final Tracks trackData;
  final Lyrics lyrics;
  TrackDataState({required this.trackData, required this.lyrics});
}

class NoInternetState extends MusixMatchState {
  final String message = "No Internet Available";
}

class LoadingState extends MusixMatchState {
  final String message = "Loading...";
}
