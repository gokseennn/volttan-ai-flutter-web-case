import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:voltran_ai_web/screens/home_screen/view/home_screen.dart';

class AppPages {
  static final getPages = <GetPage>[
    GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
    ),
  ];
}
