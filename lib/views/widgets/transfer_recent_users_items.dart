import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferRecentUsersItems extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String tag;
  final bool isVerified;

  const TransferRecentUsersItems({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.tag,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: EdgeInsets.all(
        22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Container(
          width: 45,
          height: 45,
          margin: EdgeInsets.only(
            right: 14,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(imgUrl)),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '@$tag',
              style: grayTextStyle.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
        Spacer(),
        if (isVerified)
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: greenColor,
                size: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Verified',
                style: greenTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: medium,
                ),
              )
            ],
          )
      ]),
    );
  }
}
