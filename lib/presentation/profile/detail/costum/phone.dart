import 'package:bike_online_application/bloc/profile/profile_bloc.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/pages/specifiedPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => PhonePageState();
}

class PhonePageState extends State<PhonePage> {
  TextEditingController phone = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    super.dispose();
    phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpecifiedPage(
        path: '/Costum',
        tittle: 'Change phone number',
        subTittle: 'Phone Number',
        controller: phone,
        widget: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return ButtonFormat(
                text: 'Save Phone Number',
                buttonPressed: () => context.read<ProfileBloc>().add(
                    ChangePhoneProfileEvent(
                        email: _user!.email.toString(),
                        nomorTelepon: phone.text.trim(),
                        context: context)));
          },
          listener: (context, state) {},
        ),
        hintText: 'Your phone number');
  }
}
