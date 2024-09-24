import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/custom_text_button.dart';
import 'package:pmf_website/core/utils/customs/text_field.dart';
import 'package:pmf_website/core/utils/styles.dart';

class TextFieldWithTitleAndButton extends StatelessWidget {
  const TextFieldWithTitleAndButton({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.title,
    required this.validator,
    required this.hintText,
    this.onpressed,
    this.onChanged,
    required this.enabled,
  });

  final bool obscureText;
  final String title;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final void Function()? onpressed;
  final dynamic Function(String)? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: Styles.normal16,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          hintText: hintText,
          onChanged: onChanged,
        ),
        if (onpressed != null)
          CustomTextButton(
            text: "Change",
            onpressed: onpressed,
            fontColor: enabled ? AppColors.kPrimaryColor : Colors.grey,
          ),
      ],
    );
  }
}
