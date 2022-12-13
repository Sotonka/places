import 'package:flutter/material.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:provider/provider.dart';

class AddSightProvider extends ChangeNotifier {
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
}
