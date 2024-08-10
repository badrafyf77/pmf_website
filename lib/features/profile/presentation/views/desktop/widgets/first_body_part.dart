import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/profile_image.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/profile_info.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}