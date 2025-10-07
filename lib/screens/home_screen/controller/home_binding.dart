import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:voltran_ai_web/screens/home_screen/controller/home_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.lazyPut(
      () => HomeController(),
    ),
  ];
}
