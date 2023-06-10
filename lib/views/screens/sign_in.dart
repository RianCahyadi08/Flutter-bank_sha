import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackgroundColor,
        body: ListView(
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
                  const CustomFormField(title: 'Email Address'),
                  SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'Password',
                    obscureText: true,
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
                        onPressed: () {},
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
        ));
  }
}
