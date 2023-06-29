import 'package:bank_sha/bloc/bloc/auth_bloc.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/screens/sign_up_set_profile.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
            showCustomSnackBar(context, 'Please enter email valid');
          }
          if (state is AuthCheckEmailSuccess) {
            // Navigator.pushNamed(context, '/sign-up-upload-pic');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpSetProfile(
                      data: SignUpFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  )),
                ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 100),
                width: 155,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_logo_white.png'))),
              ),
              Text(
                'Join Us To Unlock\nYour Growth',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        } else if (nameController.text.isEmpty) {
                          showCustomSnackBar(context, 'Name is required');
                        } else if (emailController.text.isEmpty) {
                          showCustomSnackBar(context, 'Email is required');
                        } else if (passwordController.text.isEmpty) {
                          showCustomSnackBar(context, 'Password is required');
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextButton(
                      title: 'Sign In',
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
