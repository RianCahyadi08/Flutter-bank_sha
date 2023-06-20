import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 24,
          top: 0,
          right: 24,
        ),
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.only(left: 22, top: 22, right: 22, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(title: 'Username'),
                SizedBox(
                  height: 16,
                ),
                CustomFormField(title: 'Full Name'),
                SizedBox(
                  height: 16,
                ),
                CustomFormField(title: 'Email Address'),
                SizedBox(
                  height: 16,
                ),
                CustomFormField(title: 'Password'),
                SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile-edit-pin');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
