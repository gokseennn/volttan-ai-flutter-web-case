import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:voltran_ai_web/common/widgets/app_header.dart';
import 'package:voltran_ai_web/screens/home_screen/view/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      backgroundColor: context.theme.colorScheme.primary,
      body: HomeBody(),
    );
  }
}
