import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeLatestTransactionsItems extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String date;
  final String value;

  const HomeLatestTransactionsItems({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.date,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(children: [
        Image.asset(
          iconUrl,
          width: 48,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                date,
                style:
                    grayTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              )
            ],
          ),
        ),
        Text(
          value,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        )
      ]),
    );
  }
}
