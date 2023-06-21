import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopUpBankItems extends StatelessWidget {
  final String imgUrl;
  final String nameBank;
  final String time;
  final bool isSelected;
  final VoidCallback? onTap;

  const TopUpBankItems(
      {Key? key,
      required this.imgUrl,
      required this.nameBank,
      required this.time,
      this.isSelected = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 14,
        bottom: 18,
      ),
      padding: EdgeInsets.only(
        left: 22,
        top: 28,
        right: 22,
        bottom: 28.89,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border: Border.all(
            width: 2,
            color: isSelected ? blueColor : whiteColor,
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          imgUrl,
          width: 96.02,
          height: 30.11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              nameBank,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              time,
              style: grayTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            )
          ],
        )
      ]),
    );
  }
}
