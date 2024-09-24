import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.obscureText = false,
    this.isTextArea = false,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.width,
    this.radius = 32,
    this.prefixIcon,
    this.onChanged,
  });

  final bool isTextArea;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final String hintText;
  final double? width;
  final double radius;
  final Widget? prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = false;
  @override
  void initState() {
    super.initState();
    showPass = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        obscureText: showPass,
        maxLines: widget.isTextArea ? 5 : 1,
        controller: widget.controller,
        validator: widget.validator,
        style: Styles.normal16,
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Styles.normal16.copyWith(color: Colors.grey),
          filled: true,
          fillColor: AppColors.kSecondColor,
          iconColor: AppColors.kPrimaryColor,
          prefixIconColor: AppColors.kPrimaryColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.prefixIcon,
          ),
          suffixIcon: widget.obscureText
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon: Icon(
                          showPass ? Icons.visibility : Icons.visibility_off)),
                )
              : null,
          suffixIconColor: AppColors.kPrimaryColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            height: 0,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
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
