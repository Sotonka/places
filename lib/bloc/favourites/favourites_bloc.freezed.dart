// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFavourites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFavouritesEvent value) loadFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFavouritesEvent value)? loadFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFavouritesEvent value)? loadFavourites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesEventCopyWith<$Res> {
  factory $FavouritesEventCopyWith(
          FavouritesEvent value, $Res Function(FavouritesEvent) then) =
      _$FavouritesEventCopyWithImpl<$Res, FavouritesEvent>;
}

/// @nodoc
class _$FavouritesEventCopyWithImpl<$Res, $Val extends FavouritesEvent>
    implements $FavouritesEventCopyWith<$Res> {
  _$FavouritesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadFavouritesEventCopyWith<$Res> {
  factory _$$LoadFavouritesEventCopyWith(_$LoadFavouritesEvent value,
          $Res Function(_$LoadFavouritesEvent) then) =
      __$$LoadFavouritesEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFavouritesEventCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res, _$LoadFavouritesEvent>
    implements _$$LoadFavouritesEventCopyWith<$Res> {
  __$$LoadFavouritesEventCopyWithImpl(
      _$LoadFavouritesEvent _value, $Res Function(_$LoadFavouritesEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFavouritesEvent implements LoadFavouritesEvent {
  const _$LoadFavouritesEvent();

  @override
  String toString() {
    return 'FavouritesEvent.loadFavourites()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFavouritesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFavourites,
  }) {
    return loadFavourites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFavourites,
  }) {
    return loadFavourites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFavourites,
    required TResult orElse(),
  }) {
    if (loadFavourites != null) {
      return loadFavourites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFavouritesEvent value) loadFavourites,
  }) {
    return loadFavourites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadFavouritesEvent value)? loadFavourites,
  }) {
    return loadFavourites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFavouritesEvent value)? loadFavourites,
    required TResult orElse(),
  }) {
    if (loadFavourites != null) {
      return loadFavourites(this);
    }
    return orElse();
  }
}

abstract class LoadFavouritesEvent implements FavouritesEvent {
  const factory LoadFavouritesEvent() = _$LoadFavouritesEvent;
}

/// @nodoc
mixin _$FavouritesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Place> loadedData) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Place> loadedData)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Place> loadedData)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavouritesLoadingState value) loading,
    required TResult Function(_FavouritesLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavouritesLoadingState value)? loading,
    TResult? Function(_FavouritesLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavouritesLoadingState value)? loading,
    TResult Function(_FavouritesLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesStateCopyWith<$Res> {
  factory $FavouritesStateCopyWith(
          FavouritesState value, $Res Function(FavouritesState) then) =
      _$FavouritesStateCopyWithImpl<$Res, FavouritesState>;
}

/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res, $Val extends FavouritesState>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FavouritesLoadingStateCopyWith<$Res> {
  factory _$$_FavouritesLoadingStateCopyWith(_$_FavouritesLoadingState value,
          $Res Function(_$_FavouritesLoadingState) then) =
      __$$_FavouritesLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FavouritesLoadingStateCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res, _$_FavouritesLoadingState>
    implements _$$_FavouritesLoadingStateCopyWith<$Res> {
  __$$_FavouritesLoadingStateCopyWithImpl(_$_FavouritesLoadingState _value,
      $Res Function(_$_FavouritesLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FavouritesLoadingState implements _FavouritesLoadingState {
  const _$_FavouritesLoadingState();

  @override
  String toString() {
    return 'FavouritesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouritesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Place> loadedData) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Place> loadedData)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Place> loadedData)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavouritesLoadingState value) loading,
    required TResult Function(_FavouritesLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavouritesLoadingState value)? loading,
    TResult? Function(_FavouritesLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavouritesLoadingState value)? loading,
    TResult Function(_FavouritesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _FavouritesLoadingState implements FavouritesState {
  const factory _FavouritesLoadingState() = _$_FavouritesLoadingState;
}

/// @nodoc
abstract class _$$_FavouritesLoadedStateCopyWith<$Res> {
  factory _$$_FavouritesLoadedStateCopyWith(_$_FavouritesLoadedState value,
          $Res Function(_$_FavouritesLoadedState) then) =
      __$$_FavouritesLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Place> loadedData});
}

/// @nodoc
class __$$_FavouritesLoadedStateCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res, _$_FavouritesLoadedState>
    implements _$$_FavouritesLoadedStateCopyWith<$Res> {
  __$$_FavouritesLoadedStateCopyWithImpl(_$_FavouritesLoadedState _value,
      $Res Function(_$_FavouritesLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedData = null,
  }) {
    return _then(_$_FavouritesLoadedState(
      loadedData: null == loadedData
          ? _value._loadedData
          : loadedData // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc

class _$_FavouritesLoadedState implements _FavouritesLoadedState {
  const _$_FavouritesLoadedState(
      {final List<Place> loadedData = const <Place>[]})
      : _loadedData = loadedData;

  final List<Place> _loadedData;
  @override
  @JsonKey()
  List<Place> get loadedData {
    if (_loadedData is EqualUnmodifiableListView) return _loadedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loadedData);
  }

  @override
  String toString() {
    return 'FavouritesState.loaded(loadedData: $loadedData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouritesLoadedState &&
            const DeepCollectionEquality()
                .equals(other._loadedData, _loadedData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_loadedData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouritesLoadedStateCopyWith<_$_FavouritesLoadedState> get copyWith =>
      __$$_FavouritesLoadedStateCopyWithImpl<_$_FavouritesLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Place> loadedData) loaded,
  }) {
    return loaded(loadedData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Place> loadedData)? loaded,
  }) {
    return loaded?.call(loadedData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Place> loadedData)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(loadedData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavouritesLoadingState value) loading,
    required TResult Function(_FavouritesLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavouritesLoadingState value)? loading,
    TResult? Function(_FavouritesLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavouritesLoadingState value)? loading,
    TResult Function(_FavouritesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _FavouritesLoadedState implements FavouritesState {
  const factory _FavouritesLoadedState({final List<Place> loadedData}) =
      _$_FavouritesLoadedState;

  List<Place> get loadedData;
  @JsonKey(ignore: true)
  _$$_FavouritesLoadedStateCopyWith<_$_FavouritesLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
