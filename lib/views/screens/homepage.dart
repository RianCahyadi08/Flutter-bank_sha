import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/home_latest_transactions_items.dart';
import 'package:bank_sha/views/widgets/home_service_items.dart';
import 'package:bank_sha/views/widgets/home_tips_items.dart';
import 'package:bank_sha/views/widgets/home_user_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendlyTips()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        notchMargin: 6,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: whiteColor,
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
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: purpleColor,
          onPressed: () {},
          child: Image.asset(
            'assets/images/ic_plus_circle.png',
            width: 24,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: grayTextStyle.copyWith(
                          fontWeight: regular, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 20),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? const AssetImage(
                                'assets/images/img_profile.png',
                              )
                            : NetworkImage(
                                state.user.profilePicture!,
                              ) as ImageProvider,
                      ),
                    ),
                    child: state.user.verified == 1
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: whiteColor),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                  size: 14,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.only(left: 30, top: 30),
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img_bg_card.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style:
                      whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: medium, letterSpacing: 6),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
                Text(
                  formatCurrency(
                      state.user.balance == null ? 0 : state.user.balance!),
                  style: whiteTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildLevel() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        width: 327,
        // height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Level 1',
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
                const Spacer(),
                Text(
                  '55% ',
                  style: greenTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                Text(
                  'of ${formatCurrency(25000)}',
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: LinearProgressIndicator(
                minHeight: 5,
                value: 0.55,
                valueColor: AlwaysStoppedAnimation(greenColor),
                backgroundColor: lightBackgroundColor,
              ),
            )
          ],
        ));
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItems(
                  iconUrl: 'assets/images/ic_topup.png',
                  title: 'Top Up',
                  onTap: () {
                    Navigator.pushNamed(context, '/topup');
                  }),
              HomeServiceItems(
                iconUrl: 'assets/images/ic_send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer-choose-user');
                },
              ),
              const HomeServiceItems(
                  iconUrl: 'assets/images/ic_withdraw.png', title: 'Withdraw'),
              HomeServiceItems(
                  iconUrl: 'assets/images/ic_more.png',
                  title: 'More',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const MoreDialog(),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Latest Transactions',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 14),
          padding: const EdgeInsets.only(left: 22, top: 22, right: 21),
          width: 327,
          height: 356,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              HomeLatestTransactionsItems(
                  iconUrl: 'assets/images/ic_transaction_cat1.png',
                  title: 'Top Up',
                  date: 'Yesterday',
                  value: '+ ${formatCurrency(450000, symbol: '')}'),
              HomeLatestTransactionsItems(
                  iconUrl: 'assets/images/ic_transaction_cat2.png',
                  title: 'Cashback',
                  date: 'Sep 11',
                  value: '+ ${formatCurrency(22000, symbol: '')}'),
              HomeLatestTransactionsItems(
                  iconUrl: 'assets/images/ic_transaction_cat3.png',
                  title: 'Withdraw',
                  date: 'Sep 2',
                  value: '- ${formatCurrency(5000, symbol: '')}'),
              HomeLatestTransactionsItems(
                  iconUrl: 'assets/images/ic_transaction_cat4.png',
                  title: 'Transfer',
                  date: 'Aug 27',
                  value: '- ${formatCurrency(13500, symbol: '')}'),
              HomeLatestTransactionsItems(
                  iconUrl: 'assets/images/ic_transaction_cat5.png',
                  title: 'Eletric',
                  date: 'Feb 18',
                  value: '- ${formatCurrency(12300000, symbol: '')}'),
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItems(
                    imageUrl: 'assets/images/img_friend1.png',
                    username: 'yuanita'),
                HomeUserItems(
                    imageUrl: 'assets/images/img_friend2.png',
                    username: 'jani'),
                HomeUserItems(
                    imageUrl: 'assets/images/img_friend3.png',
                    username: 'urip'),
                HomeUserItems(
                    imageUrl: 'assets/images/img_friend4.png', username: 'masa')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            runSpacing: 18,
            spacing: 17,
            children: [
              HomeTipsItems(
                  imageUrl: 'assets/images/img_friendly_tips1.png',
                  title: 'Best tips for using\na credit card',
                  url: Uri.parse('https://www.google.com')),
              HomeTipsItems(
                  imageUrl: 'assets/images/img_friendly_tips2.png',
                  title: 'Great hack to get\nbetter advices',
                  url: Uri.parse('https://pub.dev/')),
              HomeTipsItems(
                  imageUrl: 'assets/images/img_friendly_tips3.png',
                  title: 'Spot the good pie\nof finance model',
                  url: Uri.parse('https://www.facebook.com')),
              HomeTipsItems(
                  imageUrl: 'assets/images/img_friendly_tips4.png',
                  title: 'Save more penny\nbuy this instead',
                  url: Uri.parse('https://www.instagram.com')),
            ],
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 327,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do more With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 21,
              runSpacing: 29,
              children: [
                HomeServiceItems(
                  iconUrl: 'assets/images/ic_product_data.png',
                  title: 'Data',
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ),);
                    Navigator.pushNamed(context, '/provider-selected');
                  },
                ),
                const HomeServiceItems(
                    iconUrl: 'assets/images/ic_product_water.png',
                    title: 'Water'),
                const HomeServiceItems(
                    iconUrl: 'assets/images/ic_product_stream.png',
                    title: 'Stream'),
                const HomeServiceItems(
                    iconUrl: 'assets/images/ic_product_movie.png',
                    title: 'Movie'),
                const HomeServiceItems(
                    iconUrl: 'assets/images/ic_product_food.png',
                    title: 'Food'),
                const HomeServiceItems(
                    iconUrl: 'assets/images/ic_product_travel.png',
                    title: 'Travel'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
