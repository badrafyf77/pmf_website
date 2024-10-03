import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/profile_image.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/profile_info.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/profile_stats.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/win_rate_pie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    this.isMobile = false,
    this.isLaoding = false,
    required this.user,
  });

  final bool isMobile;
  final bool isLaoding;
  final UserInformation user;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLaoding,
      child: Column(
        children: [
          Stack(
            children: [
              const PmfBackground(),
              const SizedBox(
                height: 325,
              ),
              Positioned(
                left: 25,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ProfileImage(
                      isMobile: isMobile,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ProfileInfo(
                      isMobile: isMobile,
                      user: user,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProfileStats(
            isMobile: isMobile,
            user: user,
          ),
          const SizedBox(height: 20),
          WinRatePie(
            user: user,
          ),
        ],
      ),
    );
  }
}
