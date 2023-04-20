// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visited_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VisitedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVisitedEvent value) loadVisited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVisitedEvent value)? loadVisited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVisitedEvent value)? loadVisited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitedEventCopyWith<$Res> {
  factory $VisitedEventCopyWith(
          VisitedEvent value, $Res Function(VisitedEvent) then) =
      _$VisitedEventCopyWithImpl<$Res, VisitedEvent>;
}

/// @nodoc
class _$VisitedEventCopyWithImpl<$Res, $Val extends VisitedEvent>
    implements $VisitedEventCopyWith<$Res> {
  _$VisitedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadVisitedEventCopyWith<$Res> {
  factory _$$LoadVisitedEventCopyWith(
          _$LoadVisitedEvent value, $Res Function(_$LoadVisitedEvent) then) =
      __$$LoadVisitedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadVisitedEventCopyWithImpl<$Res>
    extends _$VisitedEventCopyWithImpl<$Res, _$LoadVisitedEvent>
    implements _$$LoadVisitedEventCopyWith<$Res> {
  __$$LoadVisitedEventCopyWithImpl(
      _$LoadVisitedEvent _value, $Res Function(_$LoadVisitedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadVisitedEvent implements LoadVisitedEvent {
  const _$LoadVisitedEvent();

  @override
  String toString() {
    return 'VisitedEvent.loadVisited()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadVisitedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisited,
  }) {
    return loadVisited();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisited,
  }) {
    return loadVisited?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisited,
    required TResult orElse(),
  }) {
    if (loadVisited != null) {
      return loadVisited();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadVisitedEvent value) loadVisited,
  }) {
    return loadVisited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadVisitedEvent value)? loadVisited,
  }) {
    return loadVisited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadVisitedEvent value)? loadVisited,
    required TResult orElse(),
  }) {
    if (loadVisited != null) {
      return loadVisited(this);
    }
    return orElse();
  }
}

abstract class LoadVisitedEvent implements VisitedEvent {
  const factory LoadVisitedEvent() = _$LoadVisitedEvent;
}

/// @nodoc
mixin _$VisitedState {
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
    required TResult Function(_VisitedLoadingState value) loading,
    required TResult Function(_VisitedLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VisitedLoadingState value)? loading,
    TResult? Function(_VisitedLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VisitedLoadingState value)? loading,
    TResult Function(_VisitedLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitedStateCopyWith<$Res> {
  factory $VisitedStateCopyWith(
          VisitedState value, $Res Function(VisitedState) then) =
      _$VisitedStateCopyWithImpl<$Res, VisitedState>;
}

/// @nodoc
class _$VisitedStateCopyWithImpl<$Res, $Val extends VisitedState>
    implements $VisitedStateCopyWith<$Res> {
  _$VisitedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_VisitedLoadingStateCopyWith<$Res> {
  factory _$$_VisitedLoadingStateCopyWith(_$_VisitedLoadingState value,
          $Res Function(_$_VisitedLoadingState) then) =
      __$$_VisitedLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_VisitedLoadingStateCopyWithImpl<$Res>
    extends _$VisitedStateCopyWithImpl<$Res, _$_VisitedLoadingState>
    implements _$$_VisitedLoadingStateCopyWith<$Res> {
  __$$_VisitedLoadingStateCopyWithImpl(_$_VisitedLoadingState _value,
      $Res Function(_$_VisitedLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_VisitedLoadingState implements _VisitedLoadingState {
  const _$_VisitedLoadingState();

  @override
  String toString() {
    return 'VisitedState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_VisitedLoadingState);
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
    required TResult Function(_VisitedLoadingState value) loading,
    required TResult Function(_VisitedLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VisitedLoadingState value)? loading,
    TResult? Function(_VisitedLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VisitedLoadingState value)? loading,
    TResult Function(_VisitedLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _VisitedLoadingState implements VisitedState {
  const factory _VisitedLoadingState() = _$_VisitedLoadingState;
}

/// @nodoc
abstract class _$$_VisitedLoadedStateCopyWith<$Res> {
  factory _$$_VisitedLoadedStateCopyWith(_$_VisitedLoadedState value,
          $Res Function(_$_VisitedLoadedState) then) =
      __$$_VisitedLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Place> loadedData});
}

/// @nodoc
class __$$_VisitedLoadedStateCopyWithImpl<$Res>
    extends _$VisitedStateCopyWithImpl<$Res, _$_VisitedLoadedState>
    implements _$$_VisitedLoadedStateCopyWith<$Res> {
  __$$_VisitedLoadedStateCopyWithImpl(
      _$_VisitedLoadedState _value, $Res Function(_$_VisitedLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedData = null,
  }) {
    return _then(_$_VisitedLoadedState(
      loadedData: null == loadedData
          ? _value._loadedData
          : loadedData // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc

class _$_VisitedLoadedState implements _VisitedLoadedState {
  const _$_VisitedLoadedState({final List<Place> loadedData = const <Place>[]})
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
    return 'VisitedState.loaded(loadedData: $loadedData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitedLoadedState &&
            const DeepCollectionEquality()
                .equals(other._loadedData, _loadedData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_loadedData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitedLoadedStateCopyWith<_$_VisitedLoadedState> get copyWith =>
      __$$_VisitedLoadedStateCopyWithImpl<_$_VisitedLoadedState>(
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
    required TResult Function(_VisitedLoadingState value) loading,
    required TResult Function(_VisitedLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VisitedLoadingState value)? loading,
    TResult? Function(_VisitedLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VisitedLoadingState value)? loading,
    TResult Function(_VisitedLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _VisitedLoadedState implements VisitedState {
  const factory _VisitedLoadedState({final List<Place> loadedData}) =
      _$_VisitedLoadedState;

  List<Place> get loadedData;
  @JsonKey(ignore: true)
  _$$_VisitedLoadedStateCopyWith<_$_VisitedLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
