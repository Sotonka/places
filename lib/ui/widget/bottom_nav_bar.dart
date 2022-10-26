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
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? UIKit.colors.primaryLightFFF
            : UIKit.colors.primaryDark22C,
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
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  )
                : UIKit.assets.svg.list(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: index == 1
                ? UIKit.assets.svg.mapFull(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  )
                : UIKit.assets.svg.map(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: index == 2
                ? UIKit.assets.svg.heartFull(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  )
                : UIKit.assets.svg.heart(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  ),
            label: 'Visiting',
          ),
          BottomNavigationBarItem(
            icon: index == 3
                ? UIKit.assets.svg.settingsFull(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  )
                : UIKit.assets.svg.settings(
                    color: Theme.of(context).brightness == Brightness.light
                        ? UIKit.colors.primaryBlueE5B
                        : UIKit.colors.primaryLightFFF,
                  ),
            label: 'Settings',
          ),
        ],
      );
}
