abstract class MusixMatchEvent {}

class MusixMatchInitialEvent extends MusixMatchEvent {}

class InternetLostEvent extends MusixMatchEvent {}

class InternetGainedEvent extends MusixMatchEvent {}

class GetTrackDataEvent extends MusixMatchEvent {
  final int trackId;
  GetTrackDataEvent(this.trackId);
}
