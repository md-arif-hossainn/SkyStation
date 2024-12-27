import 'dart:convert';

IssModel issModelFromJson(String str) => IssModel.fromJson(json.decode(str));

String issModelToJson(IssModel data) => json.encode(data.toJson());

class IssModel {
  IssPosition issPosition;
  String message;
  int timestamp;

  IssModel({
    required this.issPosition,
    required this.message,
    required this.timestamp,
  });

  factory IssModel.fromJson(Map<String, dynamic> json) => IssModel(
    issPosition: IssPosition.fromJson(json["iss_position"]),
    message: json["message"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "iss_position": issPosition.toJson(),
    "message": message,
    "timestamp": timestamp,
  };
}

class IssPosition {
  String latitude;
  String longitude;

  IssPosition({
    required this.latitude,
    required this.longitude,
  });

  factory IssPosition.fromJson(Map<String, dynamic> json) => IssPosition(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}