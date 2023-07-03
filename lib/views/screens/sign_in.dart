import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_in_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
              context, '/homepage', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/img_logo_white.png'))),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Sign In &\nGrow Your Finance',
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
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      CustomFilledButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    SignInFormModel(
                                        email: emailController.text,
                                        password: passwordController.text),
                                  ),
                                );
                          } else {
                            showCustomSnackBar(
                                context, 'Semua field harus terisi');
                          }
                          // Navigator.pushNamedAndRemoveUntil(
                          //     context, '/homepage', (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextButton(
                        title: 'Create New Account',
                        width: 165,
                        height: 24,
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-up');
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
