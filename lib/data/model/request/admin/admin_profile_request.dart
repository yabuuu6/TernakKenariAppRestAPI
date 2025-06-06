import 'dart:convert';

class AdminProfileResponseModel {
    final String? name;

    AdminProfileResponseModel({
        this.name,
    });

    factory AdminProfileResponseModel.fromJson(String str) => AdminProfileResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AdminProfileResponseModel.fromMap(Map<String, dynamic> json) => AdminProfileResponseModel(
        name: json["name"],
    );

  get message => null;

    Map<String, dynamic> toMap() => {
        "name": name,
    };
}