import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';

part 'visited_event.dart';
part 'visited_state.dart';
part 'visited_bloc.freezed.dart';

class VisitedBloc extends Bloc<VisitedEvent, VisitedState> {
  final PlaceInteractor placeInteractor;

  VisitedBloc({required this.placeInteractor})
      : super(const VisitedState.loading()) {
    on<LoadVisitedEvent>(_loadVisited);
  }

  Future<void> _loadVisited(
      LoadVisitedEvent event, Emitter<VisitedState> emit) async {
    emit(const VisitedState.loading());

    await Future<void>.delayed(const Duration(seconds: 1));

    final visitedPlaces = await placeInteractor.getVisitedPlaces();

    emit(VisitedState.loaded(
      loadedData: visitedPlaces,
    ));
  }
}
