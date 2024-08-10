import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return (!isMobile)
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatCard(
                value: 1,
                title: "Your league ranking",
              ),
              SizedBox(width: 4),
              StatCard(
                value: 234,
                title: "Matches played",
              ),
              SizedBox(width: 4),
              StatCard(
                value: 4,
                title: "Trophies",
              ),
            ],
          )
        : const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatCard(
                value: 1,
                title: "Your league ranking",
                isMobile: true,
              ),
              SizedBox(height: 4),
              StatCard(
                value: 234,
                title: "Matches played",
                isMobile: true,
              ),
              SizedBox(height: 4),
              StatCard(
                value: 4,
                title: "Trophies",
                isMobile: true,
              ),
            ],
          );
  }
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
