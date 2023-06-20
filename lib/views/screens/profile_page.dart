import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/profile_menu_items.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 24, right: 24),
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(top: 22, right: 30, bottom: 26, left: 30),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_profile.png')),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: whiteColor),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Shayna Hanna',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                SizedBox(
                  height: 40,
                ),
                ProfileMenuItems(
                  iconUrl: 'assets/images/ic_edit_profile.png',
                  nameMenu: 'Edit Profile',
                  onTap: () {
                    Navigator.pushNamed(context, '/pin');
                  },
                ),
                ProfileMenuItems(
                  iconUrl: 'assets/images/ic_my_vpn.png',
                  nameMenu: 'My PIN',
                  onTap: () {},
                ),
                ProfileMenuItems(
                  iconUrl: 'assets/images/ic_wallet_setting.png',
                  nameMenu: 'Wallet Setting',
                  onTap: () {},
                ),
                ProfileMenuItems(
                  iconUrl: 'assets/images/ic_my_rewards.png',
                  nameMenu: 'My Rewards',
                  onTap: () {},
                ),
                ProfileMenuItems(
                  iconUrl: 'assets/images/ic_help_center.png',
                  nameMenu: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItems(
                  iconUrl: 'assets/images/ic_logout.png',
                  nameMenu: 'Log Out',
                  onTap: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 87,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: CustomTextButton(
              title: 'Report a Problem',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
