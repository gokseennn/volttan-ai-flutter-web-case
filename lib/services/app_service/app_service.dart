import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AppService extends GetxService {
  late final BuildContext appContext;
  static AppService get to => Get.find<AppService>();
}
