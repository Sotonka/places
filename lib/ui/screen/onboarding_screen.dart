import 'package:flutter/material.dart';
import 'package:places/ui/providers/onboarding_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    Provider.of<OnboardingProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: SmallAppBar(
            titleWidget: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (provider.page == 2)
                  Text(
                    ' ',
                    style: theme.primaryTextTheme.headline6!.copyWith(
                      color: themeColors.greenAccent,
                    ),
                  )
                else
                  InkWell(
                    onTap: provider.jump,
                    child: Text(
                      AppStrings.onboardingSkip,
                      style: theme.primaryTextTheme.headline6!.copyWith(
                        color: themeColors.greenAccent,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: provider.controller,
                      onPageChanged: (page) {
                        provider.page = page;
                      },
                      children: const [
                        _PageFirst(),
                        _PageSecond(),
                        _PageThird(),
                      ],
                    ),
                  ),
                  _DotIndicator(
                    page: provider.page,
                    lenght: 3,
                  ),
                ],
              ),
              Positioned(
                bottom: 8,
                child: provider.page == 2
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: MediaQuery.of(context).size.width - 32,
                          ),
                          child: ColoredButton(
                            text: AppStrings.onboardingStart,
                            onPressed: provider.start,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final int page;
  final int lenght;

  const _DotIndicator({required this.page, required this.lenght});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 8),
        for (int i = 0; i < lenght; i++) ...[
          if (i == page) const _ActiveDot() else const _Dot(),
        ],
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: AppColors.primaryLightInactive,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _ActiveDot extends StatelessWidget {
  const _ActiveDot();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: 24,
      decoration: BoxDecoration(
        color: themeColors.greenAccent,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _PageFirst extends StatelessWidget {
  const _PageFirst();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 58,
      ),
      child: Column(
        children: [
          AppIcons.roadGuide(
            color: themeColors.icons,
          ),
          const SizedBox(height: 40),
          Text(
            AppStrings.onboardingFirstTitle,
            style: theme.primaryTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.onboardingFirstDesc,
            style: theme.primaryTextTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _PageSecond extends StatelessWidget {
  const _PageSecond();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 58,
      ),
      child: Column(
        children: [
          AppIcons.bag(
            color: themeColors.icons,
          ),
          const SizedBox(height: 40),
          Text(
            AppStrings.onboardingSecondTitle,
            style: theme.primaryTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.onboardingSecondDesc,
            style: theme.primaryTextTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _PageThird extends StatelessWidget {
  const _PageThird();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 58,
      ),
      child: Column(
        children: [
          AppIcons.tap(
            color: themeColors.icons,
          ),
          const SizedBox(height: 40),
          Text(
            AppStrings.onboardingThirdTitle,
            style: theme.primaryTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.onboardingThirdDesc,
            style: theme.primaryTextTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
