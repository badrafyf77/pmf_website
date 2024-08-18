import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    this.isMobile = false,
    required this.user,
  });

  final bool isMobile;
  final UserInformation user;

  @override
  Widget build(BuildContext context) {
    return (!isMobile)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children(user, isMobile),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children(user, isMobile));
  }
}

List<Widget> children(UserInformation user, bool isMobile) {
  return [
    StatCard(
      isMobile: isMobile,
      value: user.leagueRanking,
      title: "Your league ranking",
    ),
    SizedBox(
      width: isMobile ? 0 : 5,
      height: isMobile ? 5 : 0,
    ),
    StatCard(
      isMobile: isMobile,
      value: user.played,
      title: "Matches played",
    ),
    SizedBox(
      width: isMobile ? 0 : 5,
      height: isMobile ? 5 : 0,
    ),
    StatCard(
      isMobile: isMobile,
      value: 0,
      title: "Trophies",
    ),
  ];
}

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.value,
    required this.title,
    this.isMobile = false,
  });

  final int value;
  final String title;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * ((!isMobile) ? .2 : .7),
      decoration: BoxDecoration(
        color: AppColors.kSecondColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value.toString(),
            style: Styles.normal30,
            maxLines: 1,
          ),
          AutoSizeText(
            title,
            style: Styles.normal18.copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
