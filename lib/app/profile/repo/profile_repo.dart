import 'dart:convert';

import 'package:marvel/core/exports.dart';

class ProfileRepo extends AppStorage {
  Future<ApiResponse> updateProfile(dynamic body) async {
    var response = await put(
      Uri.parse('$apiUrl/accounts/${AppStorage().userId}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }
}
