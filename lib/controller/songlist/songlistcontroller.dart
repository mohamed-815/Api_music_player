import 'package:get/get.dart';

class SongListController extends GetxController {
  RxBool isloading = false.obs;
  loadTreu() {
    isloading.value = true;
  }

  loadFalse() {
    isloading.value = false;
  }
}
