import 'package:bike_online_application/common/component/PathAppBar.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(path: '/Profile', text: 'Help'),
      backgroundColor: ColorClass.background,
      body: const Column(
        children: [],
      ),
    );
  }
}