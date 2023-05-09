import 'package:get/get.dart';

class AddDataController extends GetxController {
  static AddDataController get to => Get.put(AddDataController());

  RxList programList = [].obs;
  RxList exerciseList = [].obs;
}
