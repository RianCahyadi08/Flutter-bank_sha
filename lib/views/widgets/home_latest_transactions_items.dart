import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionsItems extends StatelessWidget {
  final TransactionModel transaction;

  // ignore: use_key_in_widget_constructors
  const HomeLatestTransactionsItems({
    Key? key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(children: [
        Image.network(
          transaction.transactionType!.thumbnail!,
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
                transaction.transactionType!.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                DateFormat('MMM dd')
                    .format(transaction.createdAt ?? DateTime.now()),
                style:
                    grayTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              )
            ],
          ),
        ),
        Text(
          formatCurrency(transaction.amount ?? 0,
              symbol:
                  transaction.transactionType!.action == 'cr' ? '+ ' : '- '),
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        )
      ]),
    );
  }
}
