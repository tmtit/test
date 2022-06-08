// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static GetStorage box = GetStorage();

  static const String KEY_AUTH = "auth";

  static Future<void> setAuth({String? cookie}) async {
    await box.write(
      KEY_AUTH,
      cookie,
    );
  }

  static Future<String?> getAuth() async {
    if (box.read(KEY_AUTH) != null) {
      String authEncode = await box.read(KEY_AUTH);
      return authEncode;
    }
    return null;
  }

  static Future<void> clearLogin() async {
    await box.remove(KEY_AUTH);
  }
}
