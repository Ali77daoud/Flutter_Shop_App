import 'package:agora_shop/shared/constants/lang_constants.dart';
import 'package:get/get.dart';
import 'arabic.dart';
import 'english.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ara: ar,
        ene: en,
      };
}
