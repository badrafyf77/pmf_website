import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/utils/styles.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.isMobile,
    required this.user,
  });

  final bool isMobile;
  final UserInformation user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            user.displayName,
            style: Styles.normal30.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 20 : 30,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          AutoSizeText(
            "Joined At: ${DateFormat('yyyy-MM-dd kk:mm').format(user.joinedDate.toDate())}",
            style: Styles.normal14.copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
