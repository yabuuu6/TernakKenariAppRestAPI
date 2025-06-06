import 'dart:convert';

import 'package:canary_template/data/model/request/login_request_model.dart';
import 'package:canary_template/data/model/request/register_request_model.dart';
import 'package:canary_template/data/model/response/login_response_model.dart';
import 'package:canary_template/service/service_http_client.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = const FlutterSecureStorage();

  AuthRepository(this._serviceHttpClient);

  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'login',
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final loginResponse = LoginResponseModel.fromMap(jsonResponse);

        await secureStorage.write(
          key: "authToken",
          value: loginResponse.user?.token,
        );
        await secureStorage.write(
          key: "userRole",
          value: loginResponse.user?.role,
        );

        return Right(loginResponse);
      } else {
        return Left(jsonResponse['message'] ?? 'Login failed');
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }

  Future<Either<String, String>> register(
   RegisterRequsetModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'register',
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 201) {
        return Right(jsonResponse['message'] ?? 'Registration successful');
      } else {
        return Left(jsonResponse['message'] ?? "Registration failed");
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}