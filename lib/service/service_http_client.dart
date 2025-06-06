import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ServiceHttpClient {

  final String baseUrl = 'http://10.0.0.2:8000/api/';
final secureStorage = FlutterSecureStorage();


//POST 
Future<http.Response> post(String endPoint, Map<String, dynamic> body) async {
  final url = Uri.parse('$baseUrl$endPoint');

  try{
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );

    return response;
  } catch (e) {
    throw Exception("Post request failed: $e");
  }
}
//GET
Future<http.Response> get(String endPoint) async {
  final token = await secureStorage.read(key: "token");
  final url = Uri.parse('$baseUrl$endPoint');

  try {
    final response = await http.get(
      url,
      headers: {
       if (token != null) 'Authorization Bearer': token,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    return response;
  } catch (e) {
    throw Exception("Get request failed: $e");
  }
}

  Future postWithToken(String s, Map<String, dynamic> map) async {}
} 