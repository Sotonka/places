import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/providers/add_photo_provider.dart';
import 'package:places/ui/providers/add_sight_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class AddSightScreen extends StatelessWidget {
  const AddSightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const _BuildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _PhotoCards(),
              const SizedBox(height: 24),
              const _BuildForm(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Consumer<AddSightProvider>(
                  builder: (context, provider, child) {
                    return ColoredButton(
                      isActive: provider.isFormReady(),
                      text: AppStrings.addSightScreenCreate,
                      onPressed: () {
                        provider.submitForm(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(400);

  const _BuildAppBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SmallAppBar(
      titleWidget: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 24,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                AppStrings.addSightScreenNew,
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
                  AppStrings.addSightScreenCancel,
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
  const _BuildForm();

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
                  AppStrings.addSightScreenCategory,
                  style: theme.primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () async {
                  provider.sightTypeError = false;
                  if (provider.nameController.text.isEmpty) {
                    FocusScope.of(context).requestFocus(provider.nameFocus);
                  }

                  provider.selectedCategory =
                      await Navigator.push<Map<SightType?, String>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          _CategoriesScreen(provider.selectedCategoryToPush),
                    ),
                  );
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
                          AppStrings.addSightScreenNotSelected,
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
                      AppStrings.addSightScreenSelect,
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
                  AppStrings.addSightScreenName,
                  style: theme.primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                autovalidateMode: provider.nameController.text != ''
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                controller: provider.nameController,
                focusNode: provider.nameFocus,
                onFieldSubmitted: (_) {
                  Utils().fieldFocusChange(
                    context,
                    provider.nameFocus,
                    provider.latFocus,
                    provider.latController.text,
                  );
                },
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  provider.updateNameSuffix(
                    value,
                    themeColors.icons!,
                  );
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      provider.nameClear();
                    },
                    child: provider.nameIcon ?? const SizedBox(),
                  ),
                ),
                validator: provider.validateName,
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 100,
                  minHeight: 75,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppStrings.addSightScreenLat,
                              style: theme.primaryTextTheme.bodyText2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9.]'),
                              ),
                              TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                                  final text = newValue.text;
                                  if (text.isNotEmpty) {
                                    if (double.tryParse(text) != null) {
                                      return newValue;
                                    }
                                  }

                                  return oldValue;
                                },
                              ),
                            ],
                            autovalidateMode: provider.latController.text != ''
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
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
                                provider.lonController.text,
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
                              AppStrings.addSightScreenLon,
                              style: theme.primaryTextTheme.bodyText2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9.]'),
                              ),
                              TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                                  final text = newValue.text;
                                  if (text.isNotEmpty) {
                                    if (double.tryParse(text) != null) {
                                      return newValue;
                                    }
                                  }

                                  return oldValue;
                                },
                              ),
                            ],
                            autovalidateMode: provider.lonController.text != ''
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            controller: provider.lonController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              provider.updateLonSuffix(
                                value,
                                themeColors.icons!,
                              );
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
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.addSightScreenMark,
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: themeColors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(height: 37),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.addSightScreenDescription,
                  style: theme.primaryTextTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                autovalidateMode: provider.descriptionController.text != ''
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                controller: provider.descriptionController,
                minLines: 3,
                maxLines: 10,
                keyboardType: TextInputType.text,
                focusNode: provider.descriptionFocus,
                onChanged: (value) {
                  provider.updateDescriptionSuffix(
                    value,
                    themeColors.icons!,
                  );
                },
                onFieldSubmitted: (_) {
                  Utils().fieldFocusChange(
                    context,
                    provider.lonFocus,
                    provider.descriptionFocus,
                    provider.descriptionController.text,
                  );
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      provider.descriptionClear();
                    },
                    child: provider.descriptionIcon ?? const SizedBox(),
                  ),
                  hintText: AppStrings.addSightScreenEnter,
                ),
                validator: provider.validateDescription,
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
  final Map<SightType?, String> selecedSight;

  const _CategoriesScreen(this.selecedSight);

  @override
  State<_CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<_CategoriesScreen> {
  late Map<SightType?, String> _selecedSight;
  bool _init = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final placeTypes = {
      SightType.cafe: AppStrings.cafe.capitalize(),
      SightType.restaurant: AppStrings.restaurant.capitalize(),
      SightType.park: AppStrings.park.capitalize(),
      SightType.museum: AppStrings.museum.capitalize(),
      SightType.hotel: AppStrings.hotel.capitalize(),
      SightType.particular: AppStrings.particular.capitalize(),
    };

    if (_init) {
      _selecedSight = widget.selecedSight;

      _init = false;
    }

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
                  Navigator.pop(
                    context,
                    _selecedSight.entries.elementAt(0).key == null
                        ? {null: ''}
                        : _selecedSight,
                  );
                },
              ),
              Center(
                child: Text(
                  AppStrings.addSightScreenCatTitle,
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
              text: AppStrings.addSightScreenSave,
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

class _PhotoCards extends StatelessWidget {
  const _PhotoCards();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<AddPhotoProvider>(builder: (context, provider, child) {
      return SizedBox(
        width: double.infinity,
        height: 72,
        child: ListView.builder(
          itemCount: provider.photoList.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const _AddItem();
            }

            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Dismissible(
                background: Container(
                  height: 72,
                  width: 72,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: AppIcons.forward(
                          color: themeColors.icons,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
                direction: DismissDirection.up,
                key: UniqueKey(),
                onDismissed: (direction) {
                  provider.removePhoto(index - 1);
                },
                child: Stack(
                  children: [
                    provider.photoList[index - 1],
                    Positioned(
                      top: 6,
                      right: 6,
                      child: InkWell(
                        onTap: () {
                          provider.removePhoto(index - 1);
                        },
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            width: 20,
                            height: 20,
                          ),
                          child: const Icon(
                            Icons.cancel,
                            color: AppColors.primaryLightFFF,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class _AddItem extends StatelessWidget {
  const _AddItem();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return InkWell(
      onTap: () {
        context.read<AddPhotoProvider>().addPhoto();
      },
      child: Container(
        child: Center(
          child: AppIcons.add(
            height: 24,
            color: themeColors.greenAccent,
          ),
        ),
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          border: Border.all(
            color: themeColors.greenAccent!.withOpacity(0.4),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      child: SizedBox(
        height: 72,
        width: 72,
        child: LoadableImage(
          url:
              'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg',
        ),
      ),
    );
  }
}
