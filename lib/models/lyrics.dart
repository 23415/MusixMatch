import 'package:json_annotation/json_annotation.dart';

part 'lyrics.g.dart';

@JsonSerializable()
class Lyrics {
  /// The generated code assumes these values exist in JSON.
  final int lyrics_id;
  final String lyrics_body;
  final String lyrics_copyright;
  final String script_tracking_url;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Lyrics({
    required this.lyrics_id,
    required this.lyrics_body,
    required this.lyrics_copyright,
    required this.script_tracking_url,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LyricsToJson(this);
}
