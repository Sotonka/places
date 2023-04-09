import 'package:mobx/mobx.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filters.dart';
import 'package:places/data/model/place.dart';

part 'place_store.g.dart';

class PlaceStore = PlaceStoreBase with _$PlaceStore;

abstract class PlaceStoreBase with Store {
  final PlaceInteractor placeInteractor = PlaceInteractor();

  @observable
  List<Place> places = [];

  @observable
  bool isLoading = false;

  @observable
  bool isFailure = false;

  @action
  Future<void> getPlaces(Filter filter) async {
    isLoading = true;
    final placesOrFailure = await placeInteractor.getFilteredPlaces(filter);
    placesOrFailure.fold(
      (error) {
        isFailure = true;
      },
      (data) {
        places.clear();
        // места беру которые уже есть в БД, место с id некорректное, так что просто
        // таким образом его не включаю
        for (final place in data) {
          if (place.id != 530) {
            places.add(place);
          }
        }
      },
    );

    isLoading = false;
  }
}
