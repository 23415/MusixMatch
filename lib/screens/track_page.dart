import 'package:flutter/material.dart';

import '../models/lyrics.dart';
import '../models/tracks.dart';

class TrackPage extends StatelessWidget {
  TrackPage({
    Key? key,
    required this.track,
    required this.lyrics,
  }) : super(key: key);
  final Tracks track;
  final Lyrics lyrics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Track Details'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.bookmark_add),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(track.track_name),
              SizedBox(
                height: 8,
              ),
              Text(
                'Artist Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(track.artist_name),
              SizedBox(
                height: 8,
              ),
              Text(
                'Album Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(track.album_name),
              SizedBox(
                height: 8,
              ),
              Text('Explicit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              Text(track.explicit.toString()),
              SizedBox(
                height: 8,
              ),
              Text('Rating',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              Text(track.track_rating.toString()),
              SizedBox(
                height: 8,
              ),
              Text('Lyrics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              Text(lyrics.lyrics_body),
            ],
          ),
        ));
  }
}
