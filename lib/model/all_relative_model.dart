// To parse this JSON data, do
//
//     final allRelativeModel = allRelativeModelFromJson(jsonString);

import 'dart:convert';

AllRelativeModel allRelativeModelFromJson(String str) => AllRelativeModel.fromJson(json.decode(str));

String allRelativeModelToJson(AllRelativeModel data) => json.encode(data.toJson());

class AllRelativeModel {
  AllRelativeModel({
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
  Data? data;

  AllRelativeModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json["httpStatus"];
    httpStatusCode = json["httpStatusCode"];
    success = json["success"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() => {
    "httpStatus": httpStatus,
    "httpStatusCode": httpStatusCode,
    "success": success,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.allRelatives,
  });

  List<AllRelative>? allRelatives;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    allRelatives: List<AllRelative>.from(json["allRelatives"].map((x) => AllRelative.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "allRelatives": List<dynamic>.from(allRelatives!.map((x) => x.toJson())),
  };
}

class AllRelative {
  AllRelative({
    this.uuid,
    this.relationId,
    this.relation,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.gender,
    this.dateAndTimeOfBirth,
    this.birthDetails,
    this.birthPlace,
  });

  String ?uuid;
  int ?relationId;
  var relation;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? fullName;
  String? gender;
  DateTime ?dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  factory AllRelative.fromJson(Map<String, dynamic> json) => AllRelative(
    uuid: json["uuid"],
    relationId: json["relationId"],
    relation: json["relation"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    gender: json["gender"],
    dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
    birthDetails: BirthDetails.fromJson(json["birthDetails"]),
    birthPlace: BirthPlace.fromJson(json["birthPlace"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "relationId": relationId,
    "relation": relation,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "fullName": fullName,
    "gender": gender,
    "dateAndTimeOfBirth": dateAndTimeOfBirth!.toIso8601String(),
    "birthDetails": birthDetails!.toJson(),
    "birthPlace": birthPlace!.toJson(),
  };
}

class BirthDetails {
  BirthDetails({
    this.dobYear,
    this.dobMonth,
    this.dobDay,
    this.tobHour,
    this.meridiem,
    this.tobMin,
  });

  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  dynamic meridiem;
  int? tobMin;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
    dobYear: json["dobYear"],
    dobMonth: json["dobMonth"],
    dobDay: json["dobDay"],
    tobHour: json["tobHour"],
    meridiem: json["meridiem"],
    tobMin: json["tobMin"],
  );

  Map<String, dynamic> toJson() => {
    "dobYear": dobYear,
    "dobMonth": dobMonth,
    "dobDay": dobDay,
    "tobHour": tobHour,
    "meridiem": meridiem,
    "tobMin": tobMin,
  };
}


class BirthPlace {
  BirthPlace({
    this.placeName,
    this.placeId,
  });

  String? placeName;
  String? placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
    placeName: json["placeName"],
    placeId: json["placeId"],
  );

  Map<String, dynamic> toJson() => {
    "placeName": placeName,
    "placeId": placeId,
  };
}

