import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Akun Berhasil\nTerdaftar',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            'Grow your finance start\ntogether with us',
            style: grayTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Get Started',
            width: 183,
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
          )
        ],
      )),
    );
  }
}
