import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AuthController extends GetxController{
  Rx<TextEditingController> textController = TextEditingController().obs;
    Box? countryBox;

@override
  void onInit() {
    countryBox = Hive.box("country-list");
    super.onInit();
  }
}