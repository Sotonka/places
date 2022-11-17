import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:places/domain/settings.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/small_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const SmallAppBar(
        title: 'Настройки',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Тёмная тема'),
              trailing: CupertinoSwitch(
                trackColor: UIKit.colors.primaryLightE92.withOpacity(0.56),
                value: theme.brightness == Brightness.dark,
                onChanged: (value) {
                  Settings.themeIsLight.value = !value;
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Смотреть туториал'),
              trailing: Icon(
                Icons.info_outline,
                color: UIKit.colors.greenF50,
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
