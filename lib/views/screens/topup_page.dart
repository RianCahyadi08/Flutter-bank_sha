import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/auth/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/topup_bank_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Up',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {}
          return ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 24,
                  top: 40,
                  // right: 130,
                  bottom: 40,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthSuccess) {
                            return Row(
                              children: [
                                Image.asset(
                                  'assets/images/img_wallet.png',
                                  width: 80,
                                  height: 55,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
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
                                    Text(
                                      state.user.name.toString(),
                                      style: grayTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: regular,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Bank',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    BlocProvider(
                      create: (context) => PaymentMethodBloc()
                        ..add(
                          PaymentMethodGet(),
                        ),
                      child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                        builder: (context, state) {
                          if (state is PaymentMethodSuccess) {
                            return Column(
                              children:
                                  state.paymentMethods.map((paymentMethod) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedPaymentMethod = paymentMethod;
                                    });
                                  },
                                  child: TopUpBankItems(
                                      paymentMethod: paymentMethod,
                                      isSelected: paymentMethod.id ==
                                          selectedPaymentMethod?.id,
                                      time: '50min'),
                                );
                              }).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    Center(
                      child: selectedPaymentMethod == null
                          ? null
                          : CustomFilledButton(
                              title: 'Continue',
                              width: 327,
                              height: 50,
                              onPressed: () {
                                Navigator.pushNamed(context, '/topup-amount');
                              },
                            ),
                    ),
                    SizedBox(
                      height: 57,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
