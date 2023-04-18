import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';
part 'favourites_bloc.freezed.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final PlaceInteractor placeInteractor;

  FavouritesBloc({required this.placeInteractor})
      : super(const FavouritesState.loading()) {
    on<LoadFavouritesEvent>(_loadFavourites);
  }

  Future<void> _loadFavourites(
      LoadFavouritesEvent event, Emitter<FavouritesState> emit) async {
    emit(const FavouritesState.loading());

    final favouritePlaces = await placeInteractor.getFavouritePlaces();

    emit(FavouritesState.loaded(
      loadedData: favouritePlaces,
    ));
  }
}
