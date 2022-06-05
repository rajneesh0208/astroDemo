// To parse this JSON data, do
//
//     final askQuestionModel = askQuestionModelFromJson(jsonString);

import 'dart:convert';

AskQuestionModel askQuestionModelFromJson(String str) => AskQuestionModel.fromJson(json.decode(str));

String askQuestionModelToJson(AskQuestionModel data) => json.encode(data.toJson());

class AskQuestionModel {
  AskQuestionModel({
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
  List<Data>? data;

  factory AskQuestionModel.fromJson(Map<String, dynamic> json) => AskQuestionModel(
    httpStatus: json["httpStatus"],
    httpStatusCode: json["httpStatusCode"],
    success: json["success"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "httpStatus": httpStatus,
    "httpStatusCode": httpStatusCode,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.price,
    this.description,
    this.suggestions,
  });

  int? id;
  String? name;
  int? price;
  String? description;
  List<String>? suggestions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"] ?? null,
    suggestions: List<String>.from(json["suggestions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description ?? null,
    "suggestions": List<dynamic>.from(suggestions!.map((x) => x)),
  };
}
