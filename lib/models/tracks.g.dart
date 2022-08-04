// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      track_id: json['track_id'] as int,
      track_name: json['track_name'] as String,
      album_name: json['album_name'] as String,
      artist_name: json['artist_name'] as String,
      track_rating: (json['track_rating'] as num).toDouble(),
      explicit: json['explicit'] as int,
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'track_id': instance.track_id,
      'track_name': instance.track_name,
      'album_name': instance.album_name,
      'artist_name': instance.artist_name,
      'track_rating': instance.track_rating,
      'explicit': instance.explicit,
    };
