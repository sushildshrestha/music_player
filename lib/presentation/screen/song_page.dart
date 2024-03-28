// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/constants/text_constants.dart';
import 'package:music_player/model/playlist_provider.dart';
import 'package:music_player/presentation/widgets/neu_Box.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool isLiked = false;
  bool isSuffle = true;
  bool isRepeat = true;
  bool isPaused = false;

  //convert duration into minutes and seconds
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = '${duration.inMinutes}: ${twoDigitSeconds}';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
//get the playlist
      final playList = value.playList;
//get current song index
      final currentSong = playList[value.currentSongIndex ?? 0];

      //return Scafford
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Column(
          children: [
            //appBar
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  //title
                  Text(
                    centerTitleText,
                    style: const TextStyle(fontSize: 18),
                  ),

                  //menubutton
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                ],
              ),
            ),

            //album artwork
            NeuBox(
                child: Column(
              children: [
                //image
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(currentSong.albumImagePath)),

                //songName and artistName, icon

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      //songName
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentSong.songName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            currentSong.artistName,
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),

                      IconButton(
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          icon: isLiked
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border_outlined))
                    ],
                  ),
                )
              ],
            )),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //start time
                Text(formatTime(value.currentDuration)),

                //suffle icon
                IconButton(
                    onPressed: () {
                      setState(() {
                        isSuffle = !isSuffle;
                      });
                    },
                    icon: isSuffle
                        ? Icon(Icons.shuffle)
                        : Icon(Icons.shuffle_on_outlined)),

                //repeat icon
                IconButton(
                    onPressed: () {
                      setState(() {
                        isRepeat = !isRepeat;
                      });
                    },
                    icon: isRepeat
                        ? Icon(Icons.repeat)
                        : Icon(Icons.repeat_on_outlined)),

                //end time
                Text(formatTime(value.currentDuration))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0)),
              child: Slider(
                min: 0,
                max: value.totalDuration.inSeconds.toDouble(),
                value: value.currentDuration.inSeconds.toDouble(),
                activeColor: Colors.green,
                onChanged: (double double) {
                  //during when the user sliding around
                },
                onChangeEnd: (double double) {
                  //sliding has finished, go to that position in song duration
                  value.seek(Duration(seconds: double.toInt()));
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: NeuBox(child: Icon(Icons.skip_previous)))),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NeuBox(
                              child: value.isPlaying
                                  ? Icon(Icons.play_arrow)
                                  : Icon(Icons.pause)))),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: value.playNextSong,
                          child: NeuBox(child: Icon(Icons.skip_next)))),
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
