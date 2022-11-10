import 'package:flutter/material.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<ThemeColors>()!;

    return BottomNavigationBar(
      backgroundColor: themeColors.bottomNavBar,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute(
                builder: (context) => const SightListScreen(),
              ),
            );
            break;

          case 2:
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute(
                builder: (context) => const VisitingScreen(),
              ),
            );
            break;

          case 3:
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: index == 0
              ? UIKit.assets.svg.listFull(
                  color: themeColors.icons,
                )
              : UIKit.assets.svg.list(
                  color: themeColors.icons,
                ),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: index == 1
              ? UIKit.assets.svg.mapFull(
                  color: themeColors.icons,
                )
              : UIKit.assets.svg.map(
                  color: themeColors.icons,
                ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: index == 2
              ? UIKit.assets.svg.heartFull(
                  color: themeColors.icons,
                )
              : UIKit.assets.svg.heart(
                  color: themeColors.icons,
                ),
          label: 'Visiting',
        ),
        BottomNavigationBarItem(
          icon: index == 3
              ? UIKit.assets.svg.settingsFull(
                  color: themeColors.icons,
                )
              : UIKit.assets.svg.settings(
                  color: themeColors.icons,
                ),
          label: 'Settings',
        ),
      ],
    );
  }
}
