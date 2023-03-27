import 'package:get_storage/get_storage.dart';

class AppStorage {
  var storage = GetStorage();
  final token = GetStorage().read("token");
  final userId = GetStorage().read("userId");
  final appVersion = GetStorage().read("version");
  // final email = GetStorage().read("email");
  final email = 'izzatali@todak.com';
  final name = "izzat";

  void setToken(String token) {
    storage.write('token', token);
  }

  String getToken() {
    return storage.read('token');
  }

  void setString({required String key, required String value}) {
    storage.write(key, value);
  }

  void clearAllData() {
    storage.erase();
  }
}
