import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:voltran_ai_web/screens/app_pages.dart';
import 'package:voltran_ai_web/screens/home_screen/view/home_screen.dart';
import 'package:voltran_ai_web/utils/theme/dark_theme.dart';

class VoltranAiWebApp extends StatelessWidget {
  const VoltranAiWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: HomeScreen.routeName,
      theme: DarkTheme.themeData,
      getPages: AppPages.getPages,
      defaultTransition: Transition.cupertino,
    );
  }
}
