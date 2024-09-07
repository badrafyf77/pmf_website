import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.kPrimaryColor;
          }
          return Colors.white;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.white;
            }
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: Styles.normal14.copyWith(color: AppColors.kPrimaryColor),
      ),
    );
  }
}
