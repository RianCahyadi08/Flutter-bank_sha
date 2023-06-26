import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageSelectItem extends StatelessWidget {
  final String amount;
  final String price;
  final bool isSelected;

  const PackageSelectItem({
    Key? key,
    required this.amount,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 171,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border: isSelected
              ? Border.all(
                  color: blueColor,
                  width: 2,
                )
              : null),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          amount,
          style: blackTextStyle.copyWith(
            fontSize: 32,
            fontWeight: medium,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          price,
          style: grayTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
