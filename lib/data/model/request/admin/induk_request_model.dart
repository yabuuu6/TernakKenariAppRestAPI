import 'dart:convert';

class IndukRequestModel {
  final int? adminId;
  final String? noRing;
  final String? tanggalLahir;
  final String? jenisKelamin;
  final String? jenisKenari;
  final String? keterangan;
  final String? gambarInduk;

  IndukRequestModel({
    this.adminId,
    this.noRing,
    this.tanggalLahir,
    this.jenisKelamin,
    this.jenisKenari,
    this.keterangan,
    this.gambarInduk,
  });

  factory IndukRequestModel.fromJson(String str) => 
      IndukRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IndukRequestModel.fromMap(Map<String, dynamic> json) => IndukRequestModel(
        adminId: json["admin_id"],
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"],
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        keterangan: json["keterangan"],
        gambarInduk: json["gambar_induk"],
      );

  Map<String, dynamic> toMap() => {
        "admin_id": adminId,
        "no_ring": noRing,
        "tanggal_lahir": tanggalLahir,
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "keterangan": keterangan,
        "gambar_induk": gambarInduk,
      };
}