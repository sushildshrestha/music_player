// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/constants/text_constants.dart';
import 'package:music_player/presentation/screen/drawer_screen.dart';
import 'package:music_player/presentation/widgets/neu_Box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SongPageScreen extends StatefulWidget {
  const SongPageScreen({super.key});

  @override
  State<SongPageScreen> createState() => _SongPageScreenState();
}

class _SongPageScreenState extends State<SongPageScreen> {
  bool isFavorite = false;
  bool isSuffle = true;
  bool isRepeat = true;
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        drawer: NeuBox(child: MyDrawer()),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Column(
              children: [
                // Back button and Menu button
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //       height: 60,
                //       width: 60,
                //       child: GestureDetector(
                //         onTap: () {
                //           MyDrawer();
                //         },
                //         child: NeuBox(
                //             child: Icon(
                //           Icons.menu,
                //         )),
                //       ),
                //     ),
                //     Text(centerTitleText),
                //     SizedBox(
                //       height: 60,
                //       width: 60,
                //       child: NeuBox(
                //           child: Icon(
                //         Icons.notifications,
                //       )),
                //     ),
                //   ],
                // ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              songName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              artistName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                    color: Colors.grey,
                                  ))
                      ],
                    )
                  ],
                )),
                const SizedBox(
                  height: 25,
                ),
                //start time, suffle button, repeat button, end time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(initialTime),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isSuffle = !isSuffle;
                          });
                        },
                        child: isSuffle
                            ? Icon(Icons.shuffle)
                            : Icon(Icons.shuffle_on_outlined)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isRepeat = !isRepeat;
                          });
                        },
                        child: isRepeat
                            ? Icon(Icons.repeat)
                            : Icon(Icons.repeat_on_sharp)),
                    Text(endTime)
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                //linear bar
                NeuBox(
                    child: LinearPercentIndicator(
                  lineHeight: 10,
                  percent: 0.6,
                  progressColor: Colors.green,
                  backgroundColor: Colors.transparent,
                )),
                const SizedBox(
                  height: 25,
                ),
                //pervious song, pause play and skip next song

                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: NeuBox(
                          child: Icon(
                            Icons.skip_previous,
                            size: 30,
                          ),
                        ),
                      )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPlay = !isPlay;
                                  });
                                },
                                child: NeuBox(
                                    child: isPlay
                                        ? Icon(
                                            Icons.pause_sharp,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.play_arrow,
                                            size: 30,
                                          )),
                              ),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: NeuBox(
                            child: Icon(
                          Icons.skip_next,
                          size: 30,
                        )),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
