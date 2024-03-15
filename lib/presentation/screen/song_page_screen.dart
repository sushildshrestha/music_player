// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/constants/text_constants.dart';
import 'package:music_player/presentation/widgets/neu_Box.dart';

class SongPageScreen extends StatefulWidget {
  const SongPageScreen({super.key});

  @override
  State<SongPageScreen> createState() => _SongPageScreenState();
}

class _SongPageScreenState extends State<SongPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Column(
              children: [
                // Back button and Menu button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: NeuBox(
                          child: Icon(
                        Icons.arrow_back,
                      )),
                    ),
                    Text(centerTitleText),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: NeuBox(
                          child: Icon(
                        Icons.menu,
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                //cover art, artist name, song name
                NeuBox(
                    child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/jheli.jpg')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              songName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              artistName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),

                //start time, suffle button, repeat button, end time

                //linear bar

                //pervious song, pause play and skip next song
              ],
            ),
          ),
        ));
  }
}
