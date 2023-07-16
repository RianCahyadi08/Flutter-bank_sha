import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/operator_card/operator_card_bloc.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/screens/package_data_page.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/provider_select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderSelectedPage extends StatefulWidget {
  const ProviderSelectedPage({super.key});

  @override
  State<ProviderSelectedPage> createState() => _ProviderSelectedPageState();
}

class _ProviderSelectedPageState extends State<ProviderSelectedPage> {
  OperatorCardModel? selectedOperatorCard;
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
              BlocProvider(
                create: (context) => OperatorCardBloc()
                  ..add(
                    OperatorCardGet(),
                  ),
                child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
                  builder: (context, state) {
                    if (state is OperatorCardSuccess) {
                      return Column(
                        children: state.operatorCards.map((operatorCard) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOperatorCard = operatorCard;
                              });
                            },
                            child: ProviderSelectItem(
                              operatorCard: operatorCard,
                              isSelected:
                                  operatorCard.id == selectedOperatorCard?.id,
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              // CustomFilledButton(
              //   title: 'Continue',
              //   width: MediaQuery.of(context).size.width,
              //   height: 50,
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/package-data');
              //   },
              // ),
              const SizedBox(
                height: 57,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.only(
                left: 24,
                top: 100,
                right: 24,
              ),
              child: CustomFilledButton(
                title: 'Continue',
                width: 327,
                height: 50,
                onPressed: () {
                  // Navigator.pushNamed(context, '/package-data');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PackageDataPage(
                          operatorCard: selectedOperatorCard!,
                        ),
                      ));
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
