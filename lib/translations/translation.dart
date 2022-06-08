import 'package:minhtu/translations/en_US/en_US.dart';
import 'package:minhtu/translations/vi_VN/vi_VN.dart';

abstract class Translation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'vi_VN': viVN,
  };
}
