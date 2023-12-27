
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/presentation/auth/Forgot%20Password/forgot_password.dart';
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

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageClass.imageLogin), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        '/Login' : (context) => const LoginPage(),
        '/ForgotPassword' : (context) => const ForgotPasswordPage()
      },
    );
  }
}
