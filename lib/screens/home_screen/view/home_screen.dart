import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:voltran_ai_web/common/widgets/app_header.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';
import 'package:voltran_ai_web/screens/home_screen/view/components/home_body.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppHeader(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: HomeBody(controller: controller),
          ),
        ],
      ),
    );
  }
}
