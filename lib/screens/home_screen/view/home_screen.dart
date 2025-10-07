import 'package:flutter/material.dart';
import 'package:voltran_ai_web/common/widgets/app_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: Center(
        child: Text('Home Scree2n'),
      ),
    );
  }
}
