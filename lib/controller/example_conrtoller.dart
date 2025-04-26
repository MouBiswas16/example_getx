import 'package:get/get.dart';

class ExampleConrtoller extends GetxController {
  RxBool notification = false.obs;

  setNotifications(bool value) {
    notification.value = value;
  }
}
