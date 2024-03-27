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

                      Icon(Icons.favorite_border_outlined)
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
                Text(initialTime),

                //suffle icon
                IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),

                //repeat icon
                IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),

                //end time
                Text(endTime)
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Slider(
                min: 0,
                max: 100,
                value: 0,
                activeColor: Colors.green,
                onChanged: (value) {}),
            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: NeuBox(child: Icon(Icons.skip_previous)))),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {},
                          child: NeuBox(child: Icon(Icons.pause)))),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
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
