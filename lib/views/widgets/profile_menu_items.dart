import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItems extends StatelessWidget {
  final String iconUrl;
  final String nameMenu;
  final VoidCallback? onTap;

  // ignore: use_key_in_widget_constructors
  const ProfileMenuItems(
      {Key? key, required this.iconUrl, required this.nameMenu, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
              height: 24,
            ),
            const SizedBox(
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
