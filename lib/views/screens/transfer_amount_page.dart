import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({super.key});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPage();
}

class CurrencyFormat {
  static String converterToIdr(String number) {
    NumberFormat currenctFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );

    if (number == '') {
      number = '0';
    }

    return currenctFormatter.format(
        // int.parse(number.toString() != null ? '$number'.toString() : '0'),'
        int.parse(number.replaceAll('.', '')));
  }
}

class _TransferAmountPage extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: CurrencyFormat.converterToIdr('0'));

  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value
          .copyWith(text: CurrencyFormat.converterToIdr(text));
      print(amountController.value
          .copyWith(text: CurrencyFormat.converterToIdr(text)));
    });
  }

  converterToIdr(String number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );

    if (number == '') {
      number = '0';
    }

    return currencyFormatter
        .format(int.parse(number.replaceAll(RegExp(r'[^0-9]'), '')));
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = converterToIdr(amountController.text + number);
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        if (amountController.text == '') {
          amountController.text == '0';
        }
        // amountController.text = amountController.text
        //     .substring(0, amountController.text.length - 1);
        amountController.text = converterToIdr(amountController.text
            .substring(0, amountController.text.length - 1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 58,
        ),
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.0),
            padding: EdgeInsets.only(
              top: 40,
            ),
            child: Center(
              child: Text(
                'Total Amount',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ),
          ),
          SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                enabled: false,
                cursorColor: grayColor,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                  // letterSpacing: 16,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: grayColor,
                  )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 66,
          ),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              CustomInputButton(
                title: '1',
                onTap: () {
                  addAmount('1');
                },
              ),
              CustomInputButton(
                title: '2',
                onTap: () {
                  addAmount('2');
                },
              ),
              CustomInputButton(
                title: '3',
                onTap: () {
                  addAmount('3');
                },
              ),
              CustomInputButton(
                title: '4',
                onTap: () {
                  addAmount('4');
                },
              ),
              CustomInputButton(
                title: '5',
                onTap: () {
                  addAmount('5');
                },
              ),
              CustomInputButton(
                title: '6',
                onTap: () {
                  addAmount('6');
                },
              ),
              CustomInputButton(
                title: '7',
                onTap: () {
                  addAmount('7');
                },
              ),
              CustomInputButton(
                title: '8',
                onTap: () {
                  addAmount('8');
                },
              ),
              CustomInputButton(
                title: '9',
                onTap: () {
                  addAmount('9');
                },
              ),
              SizedBox(
                width: 60,
                height: 60,
              ),
              CustomInputButton(
                title: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: numberBackgroundColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/transfer-success',
                  (route) => false,
                );
              }
            },
          ),
          SizedBox(
            height: 25,
          ),
          CustomTextButton(title: 'Terms & Conditions', onPressed: () {}),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
