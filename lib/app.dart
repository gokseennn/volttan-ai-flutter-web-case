import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:voltran_ai_web/screens/app_pages.dart';
import 'package:voltran_ai_web/screens/home_screen/view/home_screen.dart';
import 'package:voltran_ai_web/utils/theme/light_theme.dart';

class VoltranAiWebApp extends GetMaterialApp {
  VoltranAiWebApp({super.key})
    : super(
        initialRoute: HomeScreen.routeName,
        theme: DarkTheme.themeData,
        getPages: AppPages.getPages,
      );
}
