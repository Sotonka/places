import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

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
              AppRouter.visitingScreen,
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
              ? AppIcons.listFull(
                  color: themeColors.icons,
                )
              : AppIcons.list(
                  color: themeColors.icons,
                ),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: index == 1
              ? AppIcons.mapFull(
                  color: themeColors.icons,
                )
              : AppIcons.map(
                  color: themeColors.icons,
                ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: index == 2
              ? AppIcons.heartFull(
                  color: themeColors.icons,
                )
              : AppIcons.heart(
                  color: themeColors.icons,
                ),
          label: 'Visiting',
        ),
        BottomNavigationBarItem(
          icon: index == 3
              ? AppIcons.settingsFull(
                  color: themeColors.icons,
                )
              : AppIcons.settings(
                  color: themeColors.icons,
                ),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: index == 4
              ? AppIcons.close(
                  color: themeColors.icons,
                )
              : AppIcons.back(
                  color: themeColors.icons,
                ),
          label: 'Test',
        ),
      ],
    );
  }
}
