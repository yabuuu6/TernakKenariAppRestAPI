import 'dart:convert';

class BurungSemuaTersediaModel {
  final String message;
  final int statusCode;
  final List<DataBurungTersedia> data;

  BurungSemuaTersediaModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  BurungSemuaTersediaModel copyWith({
    String? message,
    int? statusCode,
    List<DataBurungTersedia>? data,
  }) => BurungSemuaTersediaModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory BurungSemuaTersediaModel.fromRawJson(String str) =>
      BurungSemuaTersediaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BurungSemuaTersediaModel.fromJson(
    Map<String, dynamic> json,
  ) => BurungSemuaTersediaModel(
    message: json["message"],
    statusCode: json["status_code"],
    // data: List<DataBurungTersedia>.from(json["data"].map((x) => DataBurungTersedia.fromJson(x))),
    data: json["data"] == null
        ? []
        : List<DataBurungTersedia>.from(
            json["data"].map((x) => DataBurungTersedia.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BurungSemuaTersediabyIdModel {
  final String message;
  final int statusCode;
  final DataBurungTersedia data;

  BurungSemuaTersediabyIdModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  BurungSemuaTersediabyIdModel copyWith({
    String? message,
    int? statusCode,
    DataBurungTersedia? data,
  }) => BurungSemuaTersediabyIdModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory BurungSemuaTersediabyIdModel.fromRawJson(String str) =>
      BurungSemuaTersediabyIdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BurungSemuaTersediabyIdModel.fromJson(Map<String, dynamic> json) =>
      BurungSemuaTersediabyIdModel(
        message: json["message"],
        statusCode: json["status_code"],
        data: DataBurungTersedia.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": data.toJson(),
  };
}

