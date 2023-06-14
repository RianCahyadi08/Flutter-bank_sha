import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_overview.png',
                width: 20,
                height: 20,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ic_history.png',
                  width: 20,
                  height: 20,
                ),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ic_statistic.png',
                  width: 20,
                  height: 20,
                ),
                label: 'Statistic'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ic_reward.png',
                  width: 20,
                  height: 20,
                ),
                label: 'Reward')
          ]),
    );
  }
}
