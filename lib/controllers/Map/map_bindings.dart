import 'package:agora_shop/controllers/Map/map_controller.dart';
import 'package:get/get.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
