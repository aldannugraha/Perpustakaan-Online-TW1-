import 'package:get_storage/get_storage.dart';

class StorageProvider {
  static write(String key, String value) async {
    await GetStorage().write(key, value);
  }

  static String read(String key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      return "";
    }
  }

  static void delete(String key) {
    GetStorage().remove(key);
  }

  static void clearAll() {
    GetStorage().erase();
  }
}

class StorageKey {
  static const String status = "status";
  static const String idUser = "idUser";
  static const String username = "username";
  static const String role = "role";
}
