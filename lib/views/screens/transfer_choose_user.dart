import 'package:bank_sha/bloc/user/user_bloc.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:bank_sha/views/widgets/transfer_recent_users_items.dart';
import 'package:bank_sha/views/widgets/transfer_result_user_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferChooseUser extends StatefulWidget {
  const TransferChooseUser({super.key});

  @override
  State<TransferChooseUser> createState() => _TransferChooseUserState();
}

class _TransferChooseUserState extends State<TransferChooseUser> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

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
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by Username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(value));
              } else {
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          usernameController.text.isEmpty
              ? buildRecentUsers()
              : buildResultUsers(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: selectedUser == null
          ? Container()
          : Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        const SizedBox(
          height: 14,
        ),
        const TransferRecentUsersItems(
          imgUrl: 'assets/images/img_recent_users1.png',
          name: 'Yoanna',
          tag: 'yoanne',
          isVerified: true,
        ),
        const TransferRecentUsersItems(
          imgUrl: 'assets/images/img_recent_users2.png',
          name: 'John Hi',
          tag: 'jhi',
        ),
        const TransferRecentUsersItems(
          imgUrl: 'assets/images/img_recent_users3.png',
          name: 'Masayoshi',
          tag: 'form',
        ),
      ]),
    );
  }

  Widget buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            children: [
              TransferResultUserItems(
                imgUrl: 'assets/images/img_result1.png',
                name: 'Yonna Jie',
                tag: 'yoenna',
                isVerified: true,
              ),
              TransferResultUserItems(
                imgUrl: 'assets/images/img_result2.png',
                name: 'Yonne Ka',
                tag: 'yoenyu',
                isSelected: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
