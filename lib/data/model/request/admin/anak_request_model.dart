import 'dart:convert';

class AnakRequestModel {
    final int? burungId;
    final String? burungType;
    final int? harga;
    final String? deskripsi;

    AnakRequestModel({
        this.burungId,
        this.burungType,
        this.harga,
        this.deskripsi,
    });

    factory AnakRequestModel.fromJson(String str) => AnakRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AnakRequestModel.fromMap(Map<String, dynamic> json) => AnakRequestModel(
        burungId: json["burung_id"],
        burungType: json["burung_type"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toMap() => {
        "burung_id": burungId,
        "burung_type": burungType,
        "harga": harga,
        "deskripsi": deskripsi,
    };
}