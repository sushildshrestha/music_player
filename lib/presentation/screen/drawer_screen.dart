import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/constants/text_constants.dart';
import 'package:music_player/presentation/widgets/neu_Box.dart';

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
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            //home tile
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 12),
              child: ListTile(
                title: Text(
                  drawerListTileHome,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                leading: Icon(Icons.home,
                    color: Theme.of(context).colorScheme.primary),
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
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                leading: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.primary),
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
