import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:bank_sha/views/widgets/transfer_recent_users_items.dart';
import 'package:flutter/material.dart';

class TransferChooseUser extends StatelessWidget {
  const TransferChooseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transfer',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by Username',
            isShowTitle: false,
          ),
          buildRecentUsers()
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        TransferRecentUsersItems(
          imgUrl: 'assets/images/img_recent_users1.png',
          name: 'Yoanna',
          tag: 'yoanne',
          isVerified: true,
        ),
        TransferRecentUsersItems(
          imgUrl: 'assets/images/img_recent_users2.png',
          name: 'John Hi',
          tag: 'jhi',
        ),
        TransferRecentUsersItems(
          imgUrl: 'assets/images/img_recent_users3.png',
          name: 'Masayoshi',
          tag: 'form',
        ),
      ]),
    );
  }

  Widget buildResultUsers() {
    return Container();
  }
}
