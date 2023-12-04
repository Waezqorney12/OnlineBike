import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            color: Colors.black,
            height: 200 * 2,
            width: 200 * 2,
          ),
        ),
      
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 280);
    path.lineTo(0, size.height);
    
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
