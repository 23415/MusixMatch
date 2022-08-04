import 'package:json_annotation/json_annotation.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
  /// The generated code assumes these values exist in JSON.
  final int track_id;
  final String track_name;
  final String album_name;
  final String artist_name;
  final double track_rating;
  final int explicit;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Tracks({
    required this.track_id,
    required this.track_name,
    required this.album_name,
    required this.artist_name,
    required this.track_rating,
    required this.explicit,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TracksToJson(this);
}
