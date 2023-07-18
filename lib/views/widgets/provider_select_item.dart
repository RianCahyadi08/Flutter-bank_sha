import 'package:bank_sha/models/operator_card_model.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProviderSelectItem extends StatelessWidget {
  final OperatorCardModel operatorCard;
  // final String imgUrl;
  // final String nameProvider;
  // final String statusProvider;
  final bool isSelected;

  // ignore: use_key_in_widget_constructors
  const ProviderSelectItem({
    Key? key,
    required this.operatorCard,
    // required this.imgUrl,
    // required this.nameProvider,
    // required this.statusProvider,
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
      width: MediaQuery.of(context).size.width,
      height: 97,
      decoration: BoxDecoration(
          color: whiteColor,
          border: isSelected ? Border.all(color: blueColor, width: 2) : null,
          borderRadius: BorderRadius.circular(
            20,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            operatorCard.thumbnail.toString(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorCard.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                operatorCard.status.toString(),
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
