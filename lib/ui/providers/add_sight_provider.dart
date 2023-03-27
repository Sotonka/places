import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/ui_kit/strings.dart';
import 'package:places/utils/utils.dart';

class AddSightProvider extends ChangeNotifier {
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

  bool get sightTypeError => _sightTypeError;

  Map<String?, String>? get selectedCategory => _selectedCategory;

  Map<String?, String> get selectedCategoryToPush =>
      _selectedCategory ?? {'': ''};

  set selectedCategory(Map<String?, String>? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  set sightTypeError(bool value) {
    _sightTypeError = value;
  }

  Map<String?, String>? _selectedCategory = {'': ''};

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

  Future<void> submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate() &&
        !_sightTypeError &&
        _selectedCategory!.keys.toList()[0] != null &&
        _selectedCategory!.keys.toList()[0] != '') {
      await PlaceInteractor()
          .addNewPlace(Place(
            id: generateId(_nameController.text),
            lat: double.tryParse(_latController.text)!,
            lng: double.tryParse(_lonController.text)!,
            name: _nameController.text,
            urls: [
              'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg',
            ],
            placeType: _selectedCategory!.keys.toList()[0]!,
            description: _descriptionController.text,
          ))
          .then((_) => Navigator.pop(
                context,
              ));
    } else if (_selectedCategory!.keys.toList()[0] == null ||
        _selectedCategory!.keys.toList()[0] == '') {
      _sightTypeError = true;
      notifyListeners();
    }
  }

  bool isFormReady() {
    if (validateName(nameController.text) == null &&
        validateLat(latController.text) == null &&
        validateLon(lonController.text) == null &&
        validateDescription(descriptionController.text) == null &&
        _selectedCategory!.keys.toList()[0] != null &&
        _selectedCategory!.keys.toList()[0] != '') {
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
