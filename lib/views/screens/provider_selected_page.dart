import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/provider_select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderSelectedPage extends StatelessWidget {
  const ProviderSelectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Beli Data',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(
            left: 24,
            top: 30,
            right: 24,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'From Wallet',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/img_wallet.png',
                      width: 80,
                      height: 55,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.cardNumber!
                                    .replaceAllMapped(RegExp(r".{4}"),
                                        (match) => "${match.group(0)} ")
                                    .toString(),
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                                style: grayTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Provider',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const ProviderSelectItem(
                  imgUrl: 'assets/images/img_provider_telkomsel.png',
                  nameProvider: 'Telkomsel',
                  statusProvider: 'Available',
                  isSelected: true,
                ),
                const ProviderSelectItem(
                    imgUrl: 'assets/images/img_provider_indosat.png',
                    nameProvider: 'Indosat Ooredoo',
                    statusProvider: 'Available'),
                const ProviderSelectItem(
                    imgUrl: 'assets/images/img_provider_singtel.png',
                    nameProvider: 'Singtel ID',
                    statusProvider: 'Available'),
                const SizedBox(
                  height: 135,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  onPressed: () {
                    Navigator.pushNamed(context, '/package-data');
                  },
                ),
                const SizedBox(
                  height: 57,
                ),
              ],
            )
          ],
        ));
  }
}
