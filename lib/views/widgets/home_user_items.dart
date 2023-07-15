import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItems extends StatelessWidget {
  final String imageUrl;
  final String username;

  // ignore: use_key_in_widget_constructors
  const HomeUserItems(
      {Key? key, required this.imageUrl, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover)),
          ),
          Text(
            '@$username',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
          )
        ],
      ),
    );
  }
}
