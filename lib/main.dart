import 'package:flutter/material.dart';
import 'package:music_player/presentation/screen/song_page_screen.dart';
import 'package:music_player/theme/light_theme.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'theme/dark_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SongPageScreen(),
    );
  }
}
