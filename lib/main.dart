
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/presentation/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageClass.imageLogin), context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}
