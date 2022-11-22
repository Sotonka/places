import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
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
            Navigator.of(context).pushNamed(
              AppRouter.sights,
            );
            break;

          case 2:
            Navigator.of(context).pushNamed(
              AppRouter.viisitingScreen,
            );
            break;

          case 3:
            Navigator.of(context).pushNamed(
              AppRouter.settings,
            );
            break;

          case 4:
            Navigator.of(context).pushNamed(
              AppRouter.test,
            );
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: index == 0
              ? UIKit.svg.listFull(
                  color: themeColors.icons,
                )
              : UIKit.svg.list(
                  color: themeColors.icons,
                ),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: index == 1
              ? UIKit.svg.mapFull(
                  color: themeColors.icons,
                )
              : UIKit.svg.map(
                  color: themeColors.icons,
                ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: index == 2
              ? UIKit.svg.heartFull(
                  color: themeColors.icons,
                )
              : UIKit.svg.heart(
                  color: themeColors.icons,
                ),
          label: 'Visiting',
        ),
        BottomNavigationBarItem(
          icon: index == 3
              ? UIKit.svg.settingsFull(
                  color: themeColors.icons,
                )
              : UIKit.svg.settings(
                  color: themeColors.icons,
                ),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: index == 4
              ? UIKit.svg.close(
                  color: themeColors.icons,
                )
              : UIKit.svg.back(
                  color: themeColors.icons,
                ),
          label: 'Test',
        ),
      ],
    );
  }
}
