import 'package:audioplayers/audioplayers.dart';
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
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //Setters

  set currentSongIndex(int? newIndex) {
    //update current song inex
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      _currentSongIndex = newIndex;
    }

    //update UI
    notifyListeners();
  }

  /*

   A U D I O P L A Y E R

  */

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playList[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song

    //play the new song
    await _audioPlayer.play(AssetSource(path));

    _isPlaying = true;
    notifyListeners();
  }

  //pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //play or pause
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playList.length - 1) {
        //go to the next song if it is not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it is the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() {
    //if more than 5 seconds have passed, restart the song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if it's within first 5 seconds of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playList.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose the audio player
}
