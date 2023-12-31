import 'package:bike_online_application/bloc/profile/profile_bloc.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/pages/specifiedPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController address = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    super.dispose();
    address.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SpecifiedPage(
        path: '/Costum',
        tittle: 'Change address',
        subTittle: 'address',
        controller: address,
        widget: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return ButtonFormat(
                text: 'Save address',
                buttonPressed: () => context.read<ProfileBloc>().add(
                    ChangeAddressProfileEvent(
                        email: _user!.email.toString(),
                        address: address.text.trim(),
                        context: context)));
          },
          listener: (context, state) {},
        ),
        hintText: 'Your address');
  }
}