import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TransferSuccess extends StatelessWidget {
  const TransferSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Berhasil Transfer',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            'Use the money wisely and\ngrow your finance',
            style: grayTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Back to home',
            width: 183,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/homepage', (route) => false);
            },
          )
        ],
      )),
    );
  }
}
