import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageSelectItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  // final String amount;
  // final String price;
  final bool isSelected;

  // ignore: use_key_in_widget_constructors
  const PackageSelectItem({
    Key? key,
    required this.dataPlan,
    // required this.amount,
    // required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147,
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
          dataPlan.name.toString(),
          style: blackTextStyle.copyWith(
            fontSize: 32,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          formatCurrency(dataPlan.price ?? 0),
          style: grayTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
