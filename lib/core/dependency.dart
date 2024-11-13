import 'package:data_save/controller/auth_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthController(),fenix: true);
  }
  
}