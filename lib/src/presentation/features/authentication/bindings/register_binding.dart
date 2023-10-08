import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
