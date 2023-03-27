import 'dart:convert';

import 'package:http/http.dart';
import 'package:marvel/app/auth/model/api_response.dart';
import 'package:marvel/core/constants.dart';
import 'package:marvel/core/storage.dart';

class AuthRepo extends AppStorage {
  Future<ApiResponse> login(dynamic body) async {
    var headers = {
      'Authorization': 'Bearer 123',
      'Content-Type': 'application/json',
    };
    var response = await post(
      Uri.parse('$apiUrl/authenticate'),
      headers: headers,
      body: jsonEncode(body),
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> signUp(dynamic body) async {
    var response = await post(
      Uri.parse('$apiUrl/accounts'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer 123',
      },
      body: jsonEncode(body),
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> forgotPassword(dynamic body) async {
    var response = await post(
      Uri.parse('$apiUrl/accounts/forget-password'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> userData(String id) async {
    var response = await get(Uri.parse('$apiUrl/accounts/$id'), headers: {
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });

    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }
}
