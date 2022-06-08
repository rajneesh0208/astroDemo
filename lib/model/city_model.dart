// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  List<Datum>? data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    httpStatus: json["httpStatus"],
    httpStatusCode: json["httpStatusCode"],
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "httpStatus": httpStatus,
    "httpStatusCode": httpStatusCode,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.placeName,
    this.placeId,
  });

  String? placeName;
  String? placeId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    placeName: json["placeName"],
    placeId: json["placeId"],
  );

  Map<String, dynamic> toJson() => {
    "placeName": placeName,
    "placeId": placeId,
  };
}
