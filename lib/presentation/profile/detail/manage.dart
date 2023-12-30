import 'package:bike_online_application/bloc/auth/login/auth_bloc.dart';
import 'package:bike_online_application/common/component/AppBar.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAccountPage extends StatefulWidget {
  const ManageAccountPage({super.key});

  @override
  State<ManageAccountPage> createState() => ManageAccountPageState();
}

class ManageAccountPageState extends State<ManageAccountPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.background,
      appBar: const MyAppBar(path: '/Profile', text: 'Manage Account'),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return InkWell(
                    onTap: () async => context
                        .read<AuthBloc>()
                        .add(SignOutAccountEvent(context: context)),
                    child: menu(context,
                        image: ImageClass.logout,
                        title: 'Log Out',
                        subtitle:
                            'You will have to login again once you are back'),
                  );
                },
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return InkWell(
                    onTap: () async => context.read<AuthBloc>().add(
                        DeleteAccountEvent(
                            context: context, email: user!.email.toString())),
                    child: menu(context,
                        image: ImageClass.trash,
                        title: 'Delete Accout',
                        subtitle: "Your account will be deleted permanently."),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Padding menu(BuildContext contex,
      {required String image,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height5(context)),
      child: ListTile(
        leading: Container(
          height: Dimensions.height45(context),
          width: Dimensions.widht45(context),
          decoration: BoxDecoration(
              color: ColorClass.backgroundIcon,
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(image))),
        ),
        title: BinaryPoppinText(
          text: title,
          fontSize: 14,
          weight: FontWeight.bold,
          isBlack: false,
        ),
        subtitle: PoppinText(
          text: subtitle,
          fontSize: 14,
          weight: FontWeight.w500,
          color: ColorClass.white,
        ),
        trailing: Icon(
          size: Dimensions.font20(context),
          Icons.arrow_forward_ios_rounded,
          color: ColorClass.white,
        ),
      ),
    );
  }
}
