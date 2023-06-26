import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:bank_sha/views/widgets/package_select_item.dart';
import 'package:flutter/material.dart';

class PackageDataPage extends StatelessWidget {
  const PackageDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Data'),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 24,
          top: 40,
          right: 24,
          bottom: 40,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              CustomFormField(
                title: '+628',
                isShowTitle: false,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Select Package',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Wrap(
                runSpacing: 18,
                spacing: 17,
                children: [
                  PackageSelectItem(
                    amount: '10GB',
                    price: 'Rp 218.000',
                  ),
                  PackageSelectItem(
                    amount: '25GB',
                    price: 'Rp 420.000',
                  ),
                  PackageSelectItem(
                    amount: '40GB',
                    price: 'Rp 2.500.000',
                    isSelected: true,
                  ),
                  PackageSelectItem(
                    amount: '99GB',
                    price: 'Rp 5.000.000',
                  )
                ],
              ),
              SizedBox(
                height: 85,
              ),
              CustomFilledButton(
                title: 'Continue',
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  if (await Navigator.pushNamed(context, '/pin') == true) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/package-data-success',
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
