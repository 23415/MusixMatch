import 'package:asssignment/bloc/musix_match_bloc.dart';
import 'package:asssignment/bloc/musix_match_event.dart';
import 'package:asssignment/models/tracks.dart';
import 'package:asssignment/screens/track_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Trending Tracks'),
      ),
      body: BlocConsumer<MusixMatchBloc, MusixMatchState>(
        listener: (context, state) {
          // if (state == InternetState.Lost) {
          //   Scaffold.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text('NO INTERNET CONNECTION '),
          //       backgroundColor: Colors.red,
          //       duration: Duration(seconds: 5),
          //     ),
          //   );
          // } else if (state == InternetState.Gained) {
          //   Scaffold.of(context).showSnackBar(
          //     SnackBar(
          //         content: Text('Internet Connected!'),
          //         backgroundColor: Colors.green,
          //         duration: Duration(seconds: 5)),
          //   );
          // }
        },
        builder: (context, MusixMatchState state) {
          if (state is LoadingState) {
            BlocProvider.of<MusixMatchBloc>(context)
                .add(MusixMatchInitialEvent());
          }
          if (state is NoInternetState) {
            return Center(
              child: Text('No Internet Connection'),
            );
          }
          if (state is LoadingState) {
            BlocProvider.of<MusixMatchBloc>(context)
                .add(MusixMatchInitialEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrackDataState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TrackPage(track: state.trackData, lyrics: state.lyrics),
              ),
            );
            return const Center(
              child: Text('Loading...'),
            );
          } else if (state is MusixMatchInitial) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              itemBuilder: (context, index) {
                List<Tracks> tracks = state.tracks;
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    tracks[index].track_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tracks[index].artist_name),
                  trailing: Text(tracks[index].album_name),
                  leading: Icon(Icons.music_note_outlined,
                      color: Colors.black, size: 30),
                  isThreeLine: true,
                  onTap: () {
                    BlocProvider.of<MusixMatchBloc>(context)
                        .add(GetTrackDataEvent(tracks[index].track_id));
                  },
                );
              },
              itemCount: state.tracks.length,
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
