import 'package:bike_online_application/bloc/profile/profile_bloc.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/pages/specifiedPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController name = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    super.dispose();
    name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpecifiedPage(
        path: '/Costum',
        tittle: 'Change name',
        subTittle: 'Name',
        controller: name,
        widget: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return ButtonFormat(
                text: 'Save Name',
                buttonPressed: () => context.read<ProfileBloc>().add(
                    ChangeNameEvent(
                        email: _user!.email.toString(),
                        nama: name.text.trim(),
                        context: context)));
          },
          listener: (context, state) {},
        ),
        hintText: '${_user!.email}');
  }
}
