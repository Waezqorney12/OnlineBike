import 'package:bike_online_application/bloc/auth/forgotPassword/forgot_password_bloc.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/pages/specifiedPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController forgotController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    forgotController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpecifiedPage(
        path: '/Login',
        tittle: 'Forgot password',
        subTittle: 'Email',
        controller: forgotController,
        widget: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ButtonFormat(
              text: "Send Email Verification",
              buttonPressed: () {
                context.read<ForgotPasswordBloc>().add(
                    ForgotPasswordSubmitEvent(
                        context: context, email: forgotController.text.trim()));
              },
            );
          },
        ),
        hintText: 'youremail@gmail.com');
  }
}
