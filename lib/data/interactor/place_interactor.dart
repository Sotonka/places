import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

final repository = PlaceRepository();

class PlaceInteractor {
  Future<List<Place>> getPlaces() async {
    final places = await repository.getPlaces();

    return places;
  }

  Future<Place> getPlaceDetails(int id) async {
    final place = await repository.getPlace(id);

    return place;
  }

  Future<String> addNewPlace(Place place) async {
    final response = await repository.postPlace(place);

    return response;
  }

  ///
  ///
  /// для теста
  ///
  ///

  Future<void> postMocks(int offset) async {
    final place = Place(
      id: 888670,
      lat: 0,
      lng: 0,
      name: 'test',
      urls: [
        'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
      ],
      placeType: 'cafe',
      description: 'description',
    );

    await repository.postPlace(
      Place(
        id: place.id + offset,
        lat: place.lat,
        lng: place.lng,
        name: place.name + (place.id + offset).toString(),
        urls: place.urls,
        placeType: place.placeType,
        description: place.description,
      ),
    );
  }
}
