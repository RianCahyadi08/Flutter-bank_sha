import 'package:bank_sha/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferRecentUsersItems extends StatelessWidget {
  // final String imgUrl;
  // final String name;
  // final String tag;
  // final bool isVerified;
  final UserModel user;

  // ignore: use_key_in_widget_constructors
  const TransferRecentUsersItems({
    Key? key,
    required this.user,
    // required this.imgUrl,
    // required this.name,
    // required this.tag,
    // this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        padding: const EdgeInsets.all(
          22,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Center(
            child: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(
                right: 14,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: user.profilePicture == null
                        ? const AssetImage(
                            'assets/images/img_recent_users1.png')
                        : NetworkImage(
                            user.profilePicture!,
                          ) as ImageProvider),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 79,
                child: Text(
                  user.name.toString(),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                width: 58,
                child: Text(
                  '@${user.username}',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: grayTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: greenColor,
                  size: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Verified',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: greenTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                )
              ],
            )
        ]),
      ),
    );
  }
}
