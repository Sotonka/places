import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/providers/add_sight_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class AddSightScreen extends StatelessWidget {
  const AddSightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddSightProvider(),
      child: const _AddSightScreen(),
    );
  }
}

class _AddSightScreen extends StatelessWidget {
  const _AddSightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const _BuildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _BuildForm(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: ColoredButton(
                isActive: true,
                text: 'СОЗДАТЬ',
                onPressed: () {
                  context.read<AddSightProvider>().submitForm(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(400);

  const _BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SmallAppBar(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        child: Stack(
          children: [
            Center(
              child: Text(
                'Новое место',
                style: theme.primaryTextTheme.headline3,
              ),
            ),
            Positioned(
              left: 0,
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                  AppRouter.sights,
                ),
                child: Text(
                  'Отмена',
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: AppColors.primaryLightE92,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildForm extends StatelessWidget {
  const _BuildForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<AddSightProvider>(
      builder: (context, provider, child) {
        return Form(
          key: provider.formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'КАТЕГОРИЯ',
                  style: theme.primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  provider.selectedCategory =
                      await Navigator.push<Map<SightType?, String>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _CategoriesScreen(),
                    ),
                  );

                  // ignore: use_build_context_synchronously
                  FocusScope.of(context).requestFocus(provider.nameFocus);
                },
                child: ListTile(
                  title: provider.selectedCategory != null &&
                          provider.selectedCategory!.entries
                                  .toList()[0]
                                  .value !=
                              '' &&
                          provider.selectedCategory != null
                      ? Text(
                          provider.selectedCategory!.entries.toList()[0].value,
                          style: theme.primaryTextTheme.headline6,
                        )
                      : Text(
                          'Не выбрано',
                          style: theme.primaryTextTheme.headline6!.copyWith(
                            color: AppColors.primaryLightE92,
                          ),
                        ),
                  trailing: AppIcons.forward(
                    color: themeColors.icons,
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              if (provider.sightTypeError)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Выберите категорию',
                      style: AppTextStyle.normal12.copyWith(
                        color: themeColors.error,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'НАЗВАНИЕ',
                  style: theme.primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: provider.nameController,
                focusNode: provider.nameFocus,
                onFieldSubmitted: (_) {
                  Utils().fieldFocusChange(
                    context,
                    provider.nameFocus,
                    provider.latFocus,
                  );
                },
                keyboardType: TextInputType.text,
                validator: provider.validateName,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ШИРОТА',
                            style: theme.primaryTextTheme.bodyText2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: provider.latController,
                          keyboardType: TextInputType.number,
                          focusNode: provider.latFocus,
                          onChanged: (value) {
                            provider.updateLatSuffix(
                              value,
                              themeColors.icons!,
                            );
                          },
                          onFieldSubmitted: (_) {
                            Utils().fieldFocusChange(
                              context,
                              provider.latFocus,
                              provider.lonFocus,
                            );
                          },
                          validator: provider.validateLat,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                provider.latClear();
                              },
                              child: provider.latIcon ?? const SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ДОЛГОТА',
                            style: theme.primaryTextTheme.bodyText2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: provider.lonController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            provider.updateLonSuffix(value);
                          },
                          focusNode: provider.lonFocus,
                          onFieldSubmitted: (_) {
                            provider.lonFocus.unfocus();
                          },
                          validator: provider.validateLon,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                provider.lonClear();
                              },
                              child: provider.lonIcon ?? const SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Указать на карте',
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: themeColors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(height: 37),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ОПИСАНИЕ',
                  style: theme.primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: provider.descriptionController,
                minLines: 3,
                maxLines: 10,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'введите текст',
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

class _CategoriesScreen extends StatefulWidget {
  const _CategoriesScreen({super.key});

  @override
  State<_CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<_CategoriesScreen> {
  Map<SightType?, String> _selecedSight = {null: ''};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const placeTypes = {
      SightType.cafe: 'Кафе',
      SightType.restaurant: 'Ресторан',
      SightType.park: 'Парк',
      SightType.museum: 'Музей',
      SightType.hotel: 'Отель',
      SightType.particular: 'Особое место',
    };

    return Scaffold(
      appBar: SmallAppBar(
        titleWidget: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: Stack(
            children: [
              InkWell(
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.transparent,
                  child: AppIcons.back(
                    color: AppColors.primaryBlueE5B,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, {null: ''});
                },
              ),
              Center(
                child: Text(
                  'Категория',
                  style: theme.primaryTextTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: placeTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      placeTypes.entries.elementAt(index).value,
                    ),
                    trailing: AppIcons.confirm(
                      color: _selecedSight.entries.elementAt(0).key ==
                              placeTypes.entries.elementAt(index).key
                          ? Colors.green
                          : Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        _selecedSight = {
                          placeTypes.entries.elementAt(index).key:
                              placeTypes.entries.elementAt(index).value,
                        };
                      });
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
            ColoredButton(
              isActive: _selecedSight.keys.toList().first != null,
              text: 'СОХРАНИТЬ',
              onPressed: () {
                Navigator.pop(context, _selecedSight);
              },
            ),
          ],
        ),
      ),
    );
  }
}
