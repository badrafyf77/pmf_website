import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';

import 'package:pmf_website/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.backgroundColor,
    this.textColor = Colors.black,
    this.radius = 14,
    required this.height,
    required this.width,
    this.fontSize = 14,
  });

  final Function()? onPressed;
  final String textButton;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return MouseOnHoverEvent(
      child: UnconstrainedBox(
        child: SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(backgroundColor),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  ),
                ),
              ),
            ),
            child: Center(
              child: Text(
                textButton,
                style: Styles.normal14.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
