part of 'visited_bloc.dart';

@freezed
class VisitedState with _$VisitedState {
  const factory VisitedState.loading() = _VisitedLoadingState;
  const factory VisitedState.loaded({
    @Default(<Place>[]) List<Place> loadedData,
  }) = _VisitedLoadedState;
}
