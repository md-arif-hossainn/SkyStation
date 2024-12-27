import 'package:equatable/equatable.dart';



abstract class IssEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class IssDataFetched extends IssEvent {}

class CountdownTicked extends IssEvent {}

class LocationFetched extends IssEvent {
  final double latitude;
  final double longitude;

  LocationFetched({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}


