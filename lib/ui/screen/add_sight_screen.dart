import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/sight.dart';
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
                isActive: false,
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
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

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
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

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
                  title: provider.selectedCategory!.entries.toList()[0].value !=
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
                focusNode: provider.nameFocus,
                onFieldSubmitted: (_) {
                  Utils().fieldFocusChange(
                    context,
                    provider.nameFocus,
                    provider._latFocus,
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
                            provider.updateLatSuffix(value);
                          },
                          onFieldSubmitted: (_) {
                            Utils().fieldFocusChange(
                              context,
                              provider.latFocus,
                              provider._lonFocus,
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
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

class AddSightProvider with ChangeNotifier {
  final _nameController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocus = FocusNode();
  final _latFocus = FocusNode();
  final _lonFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  TextEditingController get nameController => _nameController;
  TextEditingController get latController => _latController;
  TextEditingController get lonController => _lonController;
  TextEditingController get descriptionController => _descriptionController;
  FocusNode get nameFocus => _nameFocus;
  FocusNode get latFocus => _latFocus;
  FocusNode get lonFocus => _lonFocus;
  GlobalKey<FormState> get formKey => _formKey;

  Icon? get latIcon => _latIcon;
  Icon? get lonIcon => _lonIcon;

  Sight? get sight => _sight;

  bool get sightTypeError => _sightTypeError;

  Map<SightType?, String>? get selectedCategory => _selectedCategory;

  set selectedCategory(Map<SightType?, String>? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  set sight(Sight? value) {
    _sight = value;
  }

  set sightTypeError(bool value) {
    _sightTypeError = value;
  }

  Map<SightType?, String>? _selectedCategory = {null: ''};

  Sight? _sight;
  Icon? _latIcon;
  Icon? _lonIcon;
  bool _sightTypeError = false;

  @override
  void dispose() {
    _nameController.dispose();
    _latController.dispose();
    _lonController.dispose();
    _descriptionController.dispose();
    _nameFocus.dispose();
    _latFocus.dispose();
    _lonFocus.dispose();
    super.dispose();
  }

  void latClear() {
    _latController.clear();
    notifyListeners();
  }

  void lonClear() {
    _lonController.clear();
    notifyListeners();
  }

  void updateLatSuffix(String value) {
    _latIcon = value == ''
        ? null
        : const Icon(
            Icons.cancel,
            color: Colors.black,
          );
    notifyListeners();
  }

  void updateLonSuffix(String value) {
    _lonIcon = value == ''
        ? null
        : const Icon(
            Icons.cancel,
            color: Colors.black,
          );
    notifyListeners();
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Выберите категорию';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите название';
    }

    return null;
  }

  String? validateLat(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите широту';
    }

    if (double.tryParse(value) == null) return 'Введите корректное значение';

    return null;
  }

  String? validateLon(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите долготу';
    }

    if (double.tryParse(value) == null) return 'Введите корректное значение';

    return null;
  }

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        !_sightTypeError &&
        _selectedCategory!.keys.toList()[0] != null) {
      sight = Sight(
        name: _nameController.text,
        coord: Coord(
          lat: double.tryParse(_latController.text)!,
          lon: double.tryParse(_lonController.text)!,
        ),
        url:
            'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg',
        details: _descriptionController.text,
        type: _selectedCategory!.keys.toList()[0]!,
      );

      Navigator.pop(
        context,
        context.read<AddSightProvider>().sight,
      );
    } else if (_selectedCategory!.keys.toList()[0] == null) {
      _sightTypeError = true;
      notifyListeners();
    }
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
