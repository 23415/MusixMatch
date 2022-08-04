// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lyrics _$LyricsFromJson(Map<String, dynamic> json) => Lyrics(
      lyrics_id: json['lyrics_id'] as int,
      lyrics_body: json['lyrics_body'] as String,
      lyrics_copyright: json['lyrics_copyright'] as String,
      script_tracking_url: json['script_tracking_url'] as String,
    );

Map<String, dynamic> _$LyricsToJson(Lyrics instance) => <String, dynamic>{
      'lyrics_id': instance.lyrics_id,
      'lyrics_body': instance.lyrics_body,
      'lyrics_copyright': instance.lyrics_copyright,
      'script_tracking_url': instance.script_tracking_url,
    };
