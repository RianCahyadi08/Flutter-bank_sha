import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItems extends StatelessWidget {
  final String iconUrl;
  final String nameMenu;
  final VoidCallback? onTap;

  const ProfileMenuItems(
      {Key? key, required this.iconUrl, required this.nameMenu, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              nameMenu,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            )
          ],
        ),
      ),
    );
  }
}
