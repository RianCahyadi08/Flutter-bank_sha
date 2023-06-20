import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/screens/homepage.dart';
import 'package:bank_sha/views/screens/onboarding.dart';
import 'package:bank_sha/views/screens/pin_page.dart';
import 'package:bank_sha/views/screens/profile_page.dart';
import 'package:bank_sha/views/screens/sign_in.dart';
import 'package:bank_sha/views/screens/sign_up.dart';
import 'package:bank_sha/views/screens/sign_up_set_card.dart';
import 'package:bank_sha/views/screens/sign_up_set_profile.dart';
import 'package:bank_sha/views/screens/sign_up_success.dart';
import 'package:bank_sha/views/screens/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle:
                blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          )),
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoarding(),
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),
        '/sign-up-upload-pic': (context) => const SignUpSetProfile(),
        '/sign-up-upload-card': (context) => const SignUpSetCard(),
        '/sign-up-success': (context) => const SignUpSuccess(),
        '/homepage': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/pin': (context) => const PinPage(),
      },
    );
  }
}
