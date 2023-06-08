import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/screens/sign_in.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List<String> titles = [
    'Grow Your Financial Today',
    'Build From Zero to Freedom',
    'Start Together'
  ];
  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so\nthat you can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

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
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
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
                      titles[currentIndex],
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      subtitles[currentIndex],
                      style: grayTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: currentIndex == 2 ? 38 : 50,
                    ),
                    currentIndex == 2
                        ? Column(
                            children: [
                              CustomFilledButton(
                                title: 'Get Started',
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 53,
                                height: 24,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    },
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero),
                                    child: Text(
                                      'Sign In',
                                      style: grayTextStyle.copyWith(
                                          fontSize: 16, fontWeight: regular),
                                    )),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 0
                                        ? blueColor
                                        : lightBackgroundColor),
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 1
                                        ? blueColor
                                        : lightBackgroundColor),
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 2
                                        ? blueColor
                                        : lightBackgroundColor),
                              ),
                              const Spacer(),
                              CustomFilledButton(
                                title: 'Continue',
                                width: 150,
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                              ),
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
