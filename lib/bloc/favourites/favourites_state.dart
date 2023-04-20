part of 'favourites_bloc.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.loading() = _FavouritesLoadingState;
  const factory FavouritesState.loaded({
    @Default(<Place>[]) List<Place> loadedData,
  }) = _FavouritesLoadedState;
}
