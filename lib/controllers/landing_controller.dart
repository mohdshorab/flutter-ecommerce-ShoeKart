import 'package:get/state_manager.dart';

class NavbarController extends GetxController {
// a observable variable used to updates the screen on selecting item in navbars
  var selectedIndex = 0.obs;


  void changeIndex(int index) {
    selectedIndex.value = index;
  }

}
