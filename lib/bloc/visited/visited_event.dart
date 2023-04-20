part of 'visited_bloc.dart';

@freezed
class VisitedEvent with _$VisitedEvent {
  const factory VisitedEvent.loadVisited() = LoadVisitedEvent;
}
