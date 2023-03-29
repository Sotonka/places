import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/ui/providers/theme_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Scaffold(
      appBar: const SmallAppBar(
        title: AppStrings.settingsScreenSettings,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 16,
          right: 16,
        ),
        child: ListView(
          children: [
            ListTile(
              title: const Text(AppStrings.settingsScreenDark),
              trailing: CupertinoSwitch(
                trackColor: AppColors.primaryLightE92.withOpacity(0.56),
                activeColor: themeColors.greenAccent,
                value: theme.brightness == Brightness.dark,
                onChanged: (value) {
                  context.read<ThemeProvider>().changeTheme();
                  //Settings.themeIsLight.value = !value;
                },
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.onboardingScreen,
                );
              },
              child: ListTile(
                title: const Text(
                  AppStrings.settingsScreenTutorial,
                ),
                trailing: Icon(
                  Icons.info_outline,
                  color: themeColors.greenAccent,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 3),
    );
  }
}
