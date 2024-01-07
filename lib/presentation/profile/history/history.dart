import 'package:bike_online_application/common/component/PathAppBar.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(path: '/Profile', text: 'Orders'),
      backgroundColor: ColorClass.background,
      body: const Column(
        children: [

        ],
      ),
    );
  }
}