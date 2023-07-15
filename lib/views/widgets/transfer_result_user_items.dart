import 'package:bank_sha/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferResultUserItems extends StatelessWidget {
  // final String imgUrl;
  // final String name;
  // final String tag;
  // final bool isVerified;
  final bool isSelected;
  final UserModel user;

  // ignore: use_key_in_widget_constructors
  const TransferResultUserItems({
    Key? key,
    required this.user,
    // required this.imgUrl,
    // required this.name,
    // required this.tag,
    // this.isVerified = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 22,
        ),
        width: 155,
        height: 171,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? blueColor : whiteColor,
              width: 2,
            )),
        child: Wrap(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: user.profilePicture == null
                                ? const AssetImage(
                                    'assets/images/img_result1.png')
                                : NetworkImage(
                                    user.profilePicture!,
                                  ) as ImageProvider)),
                    child: user.verified == 1
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: Icon(
                                Icons.check_circle,
                                size: 14,
                                color: greenColor,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  user.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '@${user.name}',
                  overflow: TextOverflow.ellipsis,
                  style: grayTextStyle.copyWith(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
