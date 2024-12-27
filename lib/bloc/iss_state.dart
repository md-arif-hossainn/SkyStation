
import 'package:equatable/equatable.dart';
import 'package:sky_station/model/iss_model.dart';
import 'package:sky_station/model/reverse_geo_coding_model.dart';

import '../data/response/api_response.dart';

class IssState extends Equatable {
  const IssState({
    required this.issData,
    required this.secondsRemaining,
    required this.locationName,

  });

  final ApiResponse<IssModel> issData;
  final ApiResponse<ReverseGeoCoding> locationName;
  final int secondsRemaining;


  IssState copyWith({
    ApiResponse<IssModel>? issData,
    ApiResponse<ReverseGeoCoding>? locationName,
    int? secondsRemaining,

  }) {
    return IssState(
      issData: issData ?? this.issData,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      locationName: locationName ?? this.locationName,
    );
  }

  @override
  List<Object?> get props => [issData,secondsRemaining,locationName];

}