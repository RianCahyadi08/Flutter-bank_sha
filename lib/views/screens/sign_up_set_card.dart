import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetCard extends StatefulWidget {
  final SignUpFormModel data;

  // ignore: use_key_in_widget_constructors
  const SignUpSetCard({
    Key? key,
    required this.data,
  });

  @override
  State<SignUpSetCard> createState() => _SignUpSetCardState();
}

class _SignUpSetCardState extends State<SignUpSetCard> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFail) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-up-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 100),
                width: 155,
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_logo_white.png'))),
              ),
              Text(
                'Verify Your\nAccount',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(selectedImage!.path),
                                  ),
                                ),
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                  'assets/images/ic_upload.png',
                                  width: 32,
                                ),
                              ),
                      ),
                    ),
                    Text(
                      'Passport/ID Card',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data.copyWith(
                                    ktp: selectedImage == null
                                        ? null
                                        : 'data:image/png;base64,${base64Encode(
                                            File(selectedImage!.path)
                                                .readAsBytesSync(),
                                          )}',
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackBar(context, 'Image is required');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextButton(
                      title: 'Skip for Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthRegister(widget.data));
                        Navigator.pushNamed(context, '/sign-in');
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
