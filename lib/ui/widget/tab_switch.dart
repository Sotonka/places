import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class TabSwitch extends StatelessWidget {
  final List<String> tabs;
  final TabController tabController;

  const TabSwitch({
    Key? key,
    required this.tabs,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: UIKit.colors.cardBackground,
        ),
        child: Row(
          children: [
            for (var i = 0; i < tabs.length; i++)
              Expanded(
                child: _SwitchButton(
                  onPressed: () {
                    tabController.index = i;
                  },
                  isActive: tabController.index == i,
                  text: tabs[i],
                ),
              ),
          ],
        ),
      );
}

class _SwitchButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isActive;

  const _SwitchButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: isActive ? UIKit.colors.mainFontColor : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          text,
          style: UIKit.fonts.sightType14.copyWith(
            color: isActive ? Colors.white : UIKit.colors.secondaryFontColor,
          ),
        ),
      ),
    );
  }
}
