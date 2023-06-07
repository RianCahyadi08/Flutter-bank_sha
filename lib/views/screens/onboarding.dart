import 'package:bank_sha/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                  items: [
                    Image.asset('assets/images/img_onboarding1.png',
                        height: 331, width: 230.02),
                    Image.asset('assets/images/img_onboarding2.png',
                        height: 331, width: 230.02),
                    Image.asset('assets/images/img_onboarding3.png',
                        height: 331, width: 230.02)
                  ],
                  options: CarouselOptions(
                      height: 331,
                      viewportFraction: 1,
                      enableInfiniteScroll: false)),
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Text(
                      'Grow Your\nFinancial Today',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      'Our system is helping you to\nachieve a better goal',
                      style: grayTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: blueColor),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: lightBackgroundColor),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: lightBackgroundColor),
                        ),
                        const Spacer(),
                        Container(
                          width: 150,
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Continue',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: purpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
