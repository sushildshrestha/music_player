import 'package:flutter/material.dart';
import 'package:music_player/constants/text_constants.dart';
import 'package:music_player/model/playlist_provider.dart';
import 'package:music_player/model/song_model.dart';
import 'package:music_player/presentation/screen/drawer_screen.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(centerTitleText),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        //get the playlist
        final List<Song> playList = value.playList;

        //return list view UI
        return ListView.builder(
            itemCount: playList.length,
            itemBuilder: ((context, index) {
              //get individual song
              final Song song = playList[index];

              //return list tile UI
              return ListTile(
                title: Text(
                  song.songName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumImagePath),
              );
            }));
      }),
    );
  }
}
