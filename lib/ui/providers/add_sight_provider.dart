import 'package:flutter/material.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/ui_kit/strings.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class AddSightProvider extends ChangeNotifier {
  /// [_sightTypeError] - служит для валидации типа места, принимает
  /// true, когда _selectedCategory пустая при валидации
  /// [_selectedCategory] -  по умолчанию {null: ''}, map вида
  /// {тип места: название места}
  /// [selectedCategoryToPush] - что придет на экран выбора категории - пустая
  /// категория ({null: ''}) или _selectedCategory
  /// [isFormReady] - проверяет, заполнена ли форма, не вызывая при этом
  /// _formKey.currentState!.validate() - требуется для отображения кнопки
  /// добавления места (активна/ неактивна)

  final _nameController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocus = FocusNode();
  final _latFocus = FocusNode();
  final _lonFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  TextEditingController get nameController => _nameController;
  TextEditingController get latController => _latController;
  TextEditingController get lonController => _lonController;
  TextEditingController get descriptionController => _descriptionController;
  FocusNode get nameFocus => _nameFocus;
  FocusNode get latFocus => _latFocus;
  FocusNode get lonFocus => _lonFocus;
  FocusNode get descriptionFocus => _descriptionFocus;
  GlobalKey<FormState> get formKey => _formKey;

  Icon? get latIcon => _latIcon;
  Icon? get lonIcon => _lonIcon;
  Icon? get descriptionIcon => _descriptionIcon;
  Icon? get nameIcon => _nameIcon;

  Sight? get sight => _sight;
  bool get sightTypeError => _sightTypeError;

  Map<SightType?, String>? get selectedCategory => _selectedCategory;

  Map<SightType?, String> get selectedCategoryToPush =>
      _selectedCategory ?? {null: ''};

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
  Icon? _nameIcon;
  Icon? _latIcon;
  Icon? _lonIcon;
  Icon? _descriptionIcon;
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
    _descriptionFocus.dispose();
    super.dispose();
  }

  void latClear() {
    _latController.clear();
    _latIcon = null;
    notifyListeners();
  }

  void lonClear() {
    _lonController.clear();
    _lonIcon = null;
    notifyListeners();
  }

  void nameClear() {
    _nameController.clear();
    _nameIcon = null;

    notifyListeners();
  }

  void descriptionClear() {
    _descriptionController.clear();
    _descriptionIcon = null;
    notifyListeners();
  }

  void updateLatSuffix(
    String value,
    Color color,
  ) {
    _latIcon = value == ''
        ? null
        : Icon(
            Icons.cancel,
            color: color,
          );
    notifyListeners();
  }

  void updateLonSuffix(
    String value,
    Color color,
  ) {
    _lonIcon = value == ''
        ? null
        : Icon(
            Icons.cancel,
            color: color,
          );
    notifyListeners();
  }

  void updateNameSuffix(
    String value,
    Color color,
  ) {
    _nameIcon = value == ''
        ? null
        : Icon(
            Icons.cancel,
            color: color,
          );
    notifyListeners();
  }

  void updateDescriptionSuffix(
    String value,
    Color color,
  ) {
    _descriptionIcon = value == ''
        ? null
        : Icon(
            Icons.cancel,
            color: color,
          );
    notifyListeners();
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.addSightProviderCategory;
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.addSightProviderName;
    }

    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.addSightProviderDescription;
    }

    return null;
  }

  String? validateLat(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.addSightProviderLat;
    }

    if (double.tryParse(value) == null) {
      return AppStrings.addSightProviderCorrect;
    }

    return null;
  }

  String? validateLon(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.addSightProviderLon;
    }

    if (double.tryParse(value) == null) {
      return AppStrings.addSightProviderCorrect;
    }

    return null;
  }

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        !_sightTypeError &&
        _selectedCategory!.keys.toList()[0] != null) {
      sight = Sight(
        id: generateId(),
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
      mocks.add(sight!);
      Navigator.pop(
        context,
        context.read<AddSightProvider>().sight,
      );
    } else if (_selectedCategory!.keys.toList()[0] == null) {
      _sightTypeError = true;
      notifyListeners();
    }
  }

  bool isFormReady() {
    if (validateName(nameController.text) == null &&
        validateLat(latController.text) == null &&
        validateLon(lonController.text) == null &&
        validateDescription(descriptionController.text) == null &&
        _selectedCategory!.keys.toList()[0] != null) {
      return true;
    }

    return false;
  }

  void clear() {
    _selectedCategory = {null: ''};
    _latController.clear();
    _latIcon = null;
    _lonController.clear();
    _lonIcon = null;
    _nameController.clear();
    _nameIcon = null;
    _descriptionController.clear();
    _descriptionIcon = null;
  }
}
