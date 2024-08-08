import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:pmf_website/core/utils/styles.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  final bool isSelected;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseOnHoverEvent(
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          padding: isSelected
              ? const EdgeInsets.only(
                  bottom: 5,
                )
              : null,
          decoration: isSelected
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1.2,
                    ),
                  ),
                )
              : null,
          child: Text(
            text,
            style: Styles.normal18,
          ),
        ),
      ),
    );
  }
}
