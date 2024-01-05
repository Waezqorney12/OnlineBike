// ignore_for_file: unused_import

import 'package:bike_online_application/bloc/auth/forgotPassword/forgot_password_bloc.dart';
import 'package:bike_online_application/bloc/auth/login/auth_bloc.dart';
import 'package:bike_online_application/bloc/auth/register/register_bloc.dart';
import 'package:bike_online_application/bloc/dashboard/dashboard_bloc.dart';
import 'package:bike_online_application/bloc/profile/profile_bloc.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/presentation/auth/Forgot%20Password/forgot_password.dart';
import 'package:bike_online_application/presentation/auth/login/login.dart';
import 'package:bike_online_application/presentation/auth/register/register.dart';
import 'package:bike_online_application/presentation/navigation/navigation.dart';
import 'package:bike_online_application/presentation/profile/detail/costum.dart';
import 'package:bike_online_application/presentation/profile/detail/costum/address.dart';
import 'package:bike_online_application/presentation/profile/detail/costum/name.dart';
import 'package:bike_online_application/presentation/profile/detail/costum/phone.dart';
import 'package:bike_online_application/presentation/profile/detail/manage.dart';
import 'package:bike_online_application/presentation/profile/profile.dart';
import 'package:bike_online_application/presentation/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ForgotPasswordBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => DashboardBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreenPage(),
        routes: <String, WidgetBuilder>{
          '/Register': (context) => const RegisterPage(),
          '/Login': (context) => const LoginPage(),
          '/ForgotPassword': (context) => const ForgotPasswordPage(),
          '/Navigation': (context) => const Navigations(),
          '/Profile':(context) => const ProfilePage(),
          '/Manage':(context) => const ManageAccountPage(), 
          '/Costum':(context) => const CostumAccountPage(),
          '/Phone':(context) => const PhonePage(),
          '/Name' : (context) => const NamePage(),
          '/Address' : (context) => const AddressPage()
        },
      ),
    );
  }
}
