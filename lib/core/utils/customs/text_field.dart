import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.isTextArea = false,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.width,
    this.radius = 32,
    this.prefixIcon,
  });

  final bool isTextArea;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final double? width;
  final double radius;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: isTextArea ? 5 : 1,
        controller: controller,
        validator: validator,
        style: Styles.normal16,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.normal16,
          filled: true,
          fillColor: AppColors.kSecondColor,
          iconColor: AppColors.kPrimaryColor,
          prefixIconColor: AppColors.kPrimaryColor,
          prefixIcon: prefixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            height: 0,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
