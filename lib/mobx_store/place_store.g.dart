// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaceStore on PlaceStoreBase, Store {
  late final _$placesAtom =
      Atom(name: 'PlaceStoreBase.places', context: context);

  @override
  List<Place> get places {
    _$placesAtom.reportRead();
    return super.places;
  }

  @override
  set places(List<Place> value) {
    _$placesAtom.reportWrite(value, super.places, () {
      super.places = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'PlaceStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFailureAtom =
      Atom(name: 'PlaceStoreBase.isFailure', context: context);

  @override
  bool get isFailure {
    _$isFailureAtom.reportRead();
    return super.isFailure;
  }

  @override
  set isFailure(bool value) {
    _$isFailureAtom.reportWrite(value, super.isFailure, () {
      super.isFailure = value;
    });
  }

  late final _$getPlacesAsyncAction =
      AsyncAction('PlaceStoreBase.getPlaces', context: context);

  @override
  Future<void> getPlaces(Filter filter) {
    return _$getPlacesAsyncAction.run(() => super.getPlaces(filter));
  }

  @override
  String toString() {
    return '''
places: ${places},
isLoading: ${isLoading},
isFailure: ${isFailure}
    ''';
  }
}
