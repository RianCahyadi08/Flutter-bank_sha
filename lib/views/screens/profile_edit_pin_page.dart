import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/buttons.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  bool validate() {
    if (oldPinController.text.isEmpty || newPinController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit PIN',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFail) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            print('Update berhasil');
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: EdgeInsets.only(
              left: 24,
              top: 0,
              right: 24,
            ),
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                padding:
                    EdgeInsets.only(left: 22, top: 22, right: 22, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Old PIN',
                      controller: oldPinController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'New PIN',
                      controller: newPinController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        if (oldPinController.text.isEmpty) {
                          showCustomSnackBar(context, 'Old pin harus diisi');
                        } else if (newPinController.text.isEmpty) {
                          showCustomSnackBar(context, 'New Pin harus diisi');
                        } else {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(
                                  oldPinController.text,
                                  newPinController.text,
                                ),
                              );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
