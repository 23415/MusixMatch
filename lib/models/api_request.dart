import 'dart:convert';

import 'package:asssignment/models/lyrics.dart';
import 'package:asssignment/models/tracks.dart';
import 'package:dio/dio.dart';

class ApiManager {
  final Dio dio = Dio();
  final String apiKey = "52649a660f2dd647daa93a063291ac27";

  Future<List<Tracks>> getTracks() async {
    final res = await dio.get(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$apiKey');

    List<Tracks> response = [];
    if (res.statusCode == 200) {
      final data = jsonDecode(res.data);
      final list = data['message']['body']['track_list'];
      for (var item in list) {
        response.add(Tracks.fromJson(item['track']));
      }
    }
    return response;
  }

  Future<Tracks?> getTrackData(int trackId) async {
    final res = await dio.get(
        'https://api.musixmatch.com/ws/1.1/track.get?apikey=$apiKey&track_id=$trackId');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.data);
      final track = data['message']['body']['track'];
      return Tracks.fromJson(track);
    }
    return null;
  }

  Future<Lyrics?> getLyrics(int trackId) async {
    final res = await dio.get(
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?apikey=$apiKey&track_id=$trackId');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.data);
      final lyrics = data['message']['body']['lyrics'];
      return Lyrics.fromJson(lyrics);
    }
    return null;
  }
}