import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeServiceItems extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const HomeServiceItems({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(22),
            margin: EdgeInsets.only(
              bottom: 8,
            ),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Center(
                child: Image.asset(
              iconUrl,
              width: 26,
              height: 26,
            )),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )
        ],
      ),
    );
  }
}
