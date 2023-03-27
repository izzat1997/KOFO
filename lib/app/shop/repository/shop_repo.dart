import 'dart:convert';
import 'dart:io';

import 'package:marvel/core/exports.dart';

class ShopRepo extends AppStorage {
  Future<ApiResponse> searchShop() async {
    var response = await get(
      Uri.parse('$apiUrl/accounts/vendor'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> searchProduct() async {
    var response = await get(
      Uri.parse('$apiUrl/shopping/product'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> getComments() async {
    var response = await get(
      Uri.parse('$apiUrl/accounts/comment'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> createComment(dynamic body) async {
    var response = await post(
      Uri.parse('$apiUrl/accounts/comment'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> createLike(String slug, dynamic body) async {
    var response = await put(
      Uri.parse('$apiUrl/accounts/vendor/like/$slug'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> addCart(dynamic body) async {
    var response = await post(
      Uri.parse('$apiUrl/shopping/cart'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }

  Future<ApiResponse> addComment(dynamic body) async {
    var response = await post(
      Uri.parse('$apiUrl/shopping/cart'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );
//     {
//   "account": "cdaea5c7-23a8-4e08-a0b8-37f91733831c",
//   "vendor": "3af28d8a-96bc-4b5e-847b-8a3fd9f936e6",
//   "content": "string",
//   "createdBy": "cdaea5c7-23a8-4e08-a0b8-37f91733831c"
// }
    return ApiResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
  }
}
