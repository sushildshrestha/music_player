import 'package:flutter/cupertino.dart';

import 'song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playList = [
    Song(
        songName: "jheli",
        artistName: "Uniq Poet, Kavi G",
        albumImagePath: "assets/images/jheli.jpg",
        audioPath: "assets/audio/jheli.mp3"),
    Song(
        songName: "Stan",
        artistName: "Eminem",
        albumImagePath: "assets/images/stan.jpeg",
        audioPath: "assets/audio/Stan.mp3"),
    Song(
        songName: "Mantramugdha",
        artistName: "Satish",
        albumImagePath: "assets/images/mantramugdha.jpg",
        audioPath: "assets/audio/mantramugdha.mp3"),
    Song(
        songName: "Aakashaima Chill Udyo",
        artistName: "Monkey Temple",
        albumImagePath: "assets/images/monkeytemple.jpeg",
        audioPath: "assets/audio/MonkeyTemple.mp3"),
  ];
  //current song playing index
  int? _currentSongIndex;

  // Getters
  List<Song> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;
}
