// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/constants/text_constants.dart';
import 'package:music_player/theme/dark_theme.dart';
import 'package:music_player/theme/dark_theme.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({super.key});

  @override
  State<SettingsPageScreen> createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsScreenAppBarTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(settingsScreenThemeSwitchText),
              CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) {
                    //isSwitched = !isSwitched;
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  }),
            ],
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
