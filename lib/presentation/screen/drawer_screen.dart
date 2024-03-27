// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/constants/text_constants.dart';

import 'settings_page_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            //drawerHeader logo
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.music_note,
                  size: 30,
                ),
              ),
            ),

            //home tile
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 12),
              child: ListTile(
                title: Text(
                  drawerListTileHome,
                ),
                leading: Icon(
                  Icons.home,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            //settings tile
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 12),
              child: ListTile(
                title: Text(
                  drawerListTileSettings,
                ),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPageScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
