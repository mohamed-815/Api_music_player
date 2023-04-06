import 'package:get/get.dart';

class SongPlayController extends GetxController {
  RxBool isload = false.obs;
  loadTreu() {
    isload.value = true;
  }

  loadFalse() {
    isload.value = false;
  }
}
