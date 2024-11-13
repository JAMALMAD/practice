import 'package:get/get_navigation/src/routes/get_route.dart';

import '../widget/home_screen/home_Screen.dart';

class Approute{
  static const homeScreen = "/homeScreen";
  static List<GetPage> getPage = [
    GetPage(name: homeScreen, page: ()=> HomeScreen())
  ];
}