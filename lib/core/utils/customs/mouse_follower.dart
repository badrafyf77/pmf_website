import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:pmf_website/core/utils/helpers/is_mobile_checker.dart';

class MouseFollowerWidget extends StatelessWidget {
  final Widget child;

  const MouseFollowerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileChecker(context);
    return MouseFollower(
      isVisible: isMobile ? false : true,
      mouseStylesStack: [
        MouseStyle(
          size: const Size(7, 7),
          latency: const Duration(milliseconds: 25),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle),
        ),
        MouseStyle(
          size: const Size(26, 26),
          latency: const Duration(milliseconds: 75),
          visibleOnHover: false,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
      onHoverMouseStylesStack: [
        MouseStyle(
          size: const Size(50, 50),
          latency: const Duration(milliseconds: 25),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary.withAlpha(150)),
        ),
      ],
      child: child,
    );
  }
}
