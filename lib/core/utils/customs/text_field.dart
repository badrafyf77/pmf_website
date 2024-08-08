import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.isTextArea = false,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.width,
  });

  final bool isTextArea;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: isTextArea ? 5 : 1,
        controller: controller,
        validator: validator,
        style: Styles.normal16.copyWith(
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.normal16.copyWith(
            color: Colors.grey[800],
          ),
          filled: true,
          fillColor: Colors.grey[200],
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            height: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
