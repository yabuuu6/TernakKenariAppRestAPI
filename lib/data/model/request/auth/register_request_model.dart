import 'dart:convert';

class RegisterRequsetModel {
    final String? username;
    final String? email;
    final String? password;
    final String? passwordConfirmation;
    final int? roleId;

    RegisterRequsetModel({
        this.username,
        this.email,
        this.password,
        this.passwordConfirmation,
        this.roleId,
    });

    factory RegisterRequsetModel.fromJson(String str) => RegisterRequsetModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequsetModel.fromMap(Map<String, dynamic> json) => RegisterRequsetModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "role_id": roleId,
    };
}
