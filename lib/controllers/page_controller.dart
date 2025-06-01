import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class PageController extends GetxController {
  final SidebarXController sidebarController = SidebarXController(selectedIndex: 0);

  @override
  void onClose() {
    sidebarController.dispose();
    super.onClose();
  }
}
