// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/constants/text_constants.dart';

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({super.key});

  @override
  State<SettingsPageScreen> createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsScreenAppBarTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Text(settingsScreenThemeSwitchText),
              CupertinoSwitch(value: true, onChanged: (value) {})
            ],
          ),
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
