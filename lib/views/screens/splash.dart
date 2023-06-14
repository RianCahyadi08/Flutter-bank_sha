import 'dart:async';

import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/screens/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/onboarding', (route) => false);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => OnBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          width: 155,
          height: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_logo_dark.png'))),
        ),
      ),
    );
  }
}
