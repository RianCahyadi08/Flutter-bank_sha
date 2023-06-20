import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bank_sha/shared/theme.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomFilledButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.height = 50,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        style: TextButton.styleFrom(
            backgroundColor: purpleColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56))),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomTextButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.height = 50,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            title,
            style: grayTextStyle.copyWith(fontSize: 16, fontWeight: regular),
          )),
    );
  }
}

class CustomInputButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CustomInputButton({Key? key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: numberBackgroundColor,
        ),
        child: Center(
            child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        )),
      ),
    );
  }
}
