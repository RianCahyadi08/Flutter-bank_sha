import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/screens/package_data_page.dart';
import 'package:bank_sha/views/screens/homepage.dart';
import 'package:bank_sha/views/screens/onboarding.dart';
import 'package:bank_sha/views/screens/package_data_success.dart';
import 'package:bank_sha/views/screens/pin_page.dart';
import 'package:bank_sha/views/screens/profile_edit_page.dart';
import 'package:bank_sha/views/screens/profile_edit_pin_page.dart';
import 'package:bank_sha/views/screens/profile_edit_success_page.dart';
import 'package:bank_sha/views/screens/profile_page.dart';
import 'package:bank_sha/views/screens/provider_selected_page.dart';
import 'package:bank_sha/views/screens/sign_in.dart';
import 'package:bank_sha/views/screens/sign_up.dart';
// import 'package:bank_sha/views/screens/sign_up_set_card.dart';
// import 'package:bank_sha/views/screens/sign_up_set_profile.dart';
import 'package:bank_sha/views/screens/sign_up_success.dart';
import 'package:bank_sha/views/screens/splash.dart';
// import 'package:bank_sha/views/screens/topup_amount_page.dart';
import 'package:bank_sha/views/screens/topup_page.dart';
import 'package:bank_sha/views/screens/topup_success_page.dart';
import 'package:bank_sha/views/screens/transfer_amount_page.dart';
import 'package:bank_sha/views/screens/transfer_choose_user.dart';
import 'package:bank_sha/views/screens/transfer_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              AuthGetCurrentUser(),
            ),
        )
      ],
      child: MaterialApp(
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
          // '/sign-up-upload-pic': (context) => const SignUpSetProfile(),
          // '/sign-up-upload-card': (context) => const SignUpSetCard(),
          '/sign-up-success': (context) => const SignUpSuccess(),
          '/homepage': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopupPage(),
          // '/topup-amount': (context) => const TopUpAmountPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer-choose-user': (context) => const TransferChooseUser(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccess(),
          '/provider-selected': (context) => const ProviderSelectedPage(),
          '/package-data': (context) => const PackageDataPage(),
          '/package-data-success': (context) => const PackageDataSuccess(),
        },
      ),
    );
  }
}
