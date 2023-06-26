import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProviderSelectItem extends StatelessWidget {
  final String imgUrl;
  final String nameProvider;
  final String statusProvider;
  final bool isSelected;

  const ProviderSelectItem({
    Key? key,
    required this.imgUrl,
    required this.nameProvider,
    required this.statusProvider,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 14,
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      width: 327,
      height: 87,
      decoration: BoxDecoration(
          color: whiteColor,
          border: isSelected ? Border.all(color: blueColor, width: 2) : null,
          borderRadius: BorderRadius.circular(
            20,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imgUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                nameProvider,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                statusProvider,
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
