import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/data/repository/mapper.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/filters.dart';

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

  Future<List<Place>> getFilteresPlaces(Filter filter) async {
    final response = await repository.getFilteredPlaces(filter);
    response.sort((a, b) => a.distance.compareTo(b.distance));

    final places = await _fromApiToUI(response);

    return places;
  }

  Future<List<Place>> searchPlaces(
    Filter filter,
    String search,
  ) async {
    final response = await repository.searchPlaces(filter, search);

    final places = await _fromApiToUI(response);

    return places;
  }

  Future<Place> _fromApiToUIPlace(PlaceDto place) async {
    return Mapper.fromApi(place);
  }

  Future<List<Place>> _fromApiToUI(List<PlaceDto> apiPlaces) async {
    return apiPlaces.map(Mapper.fromApi).toList();
  }
}
