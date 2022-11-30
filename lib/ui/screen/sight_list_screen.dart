import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/gradient_button.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/sight_list_screen_app_bar.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatelessWidget {
  const SightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SightListProvider(),
        ),
      ],
      child: const _SighListScreen(),
    );
  }
}

class _SighListScreen extends StatelessWidget {
  const _SighListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.sightListScreenTitle),
      body: Stack(
        children: [
          Consumer<SightListProvider>(
            builder: (context, provider, child) {
              return ListView.separated(
                itemCount: provider.sightList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return SightCard(
                    sight: provider.sightList[index],
                    type: CardType.list,
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(
                    text: 'НОВОЕ МЕСТО',
                    onPressed: () async {
                      context
                          .read<SightListProvider>()
                          .appendSigtList(await Navigator.push<Sight>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddSightScreen(),
                            ),
                          ));
                    },
                    icon: AppIcons.add(
                      height: 18,
                      width: 18,
                      color: AppColors.primaryLightFFF,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRouter.filterScreen,
          );
        },
        child: const Text('filters'),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}

class SightListProvider with ChangeNotifier {
  final List<Sight> _sightList = mocks;

  List<Sight> get sightList => _sightList;

  void appendSigtList(Sight? newSight) {
    if (newSight != null) {
      _sightList.add(newSight);
      notifyListeners();
    }
  }
}
