import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
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
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: index == 0
                ? UIKit.assets.svg.listFull(
                    color: UIKit.colors.mainFontColor,
                  )
                : UIKit.assets.svg.list(
                    color: UIKit.colors.mainFontColor,
                  ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: index == 1
                ? UIKit.assets.svg.mapFull(
                    color: UIKit.colors.mainFontColor,
                  )
                : UIKit.assets.svg.map(
                    color: UIKit.colors.mainFontColor,
                  ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: index == 2
                ? UIKit.assets.svg.heartFull(
                    color: UIKit.colors.mainFontColor,
                  )
                : UIKit.assets.svg.heart(
                    color: UIKit.colors.mainFontColor,
                  ),
            label: 'Visiting',
          ),
          BottomNavigationBarItem(
            icon: index == 3
                ? UIKit.assets.svg.settingsFull(
                    color: UIKit.colors.mainFontColor,
                  )
                : UIKit.assets.svg.settings(
                    color: UIKit.colors.mainFontColor,
                  ),
            label: 'Settings',
          ),
        ],
      );
}
