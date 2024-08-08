import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class AppbarDropdown extends StatelessWidget {
  AppbarDropdown({super.key, required this.itemCount});

  final int itemCount;

  final dropdownButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'PARTENAIRES',
    ];
    if (itemCount == 1) {
      items.removeAt(0);
    }
    return MouseRegion(
      onHover: (event) {
        openDropdown();
      },
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          key: dropdownButtonKey,
          customButton: const Icon(
            Icons.expand_more,
            size: 22,
            color: Colors.white,
          ),
          items: items
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Styles.normal14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            onChanged(context, value!);
          },
          dropdownStyleData: DropdownStyleData(
            width: 180,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            offset: const Offset(0, 8),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.only(left: 16, right: 16),
          ),
        ),
      ),
    );
  }

  void openDropdown() {
    dropdownButtonKey.currentContext?.visitChildElements((element) {
      if (element.widget is Semantics) {
        element.visitChildElements((element) {
          if (element.widget is Actions) {
            element.visitChildElements((element) {
              Actions.invoke(element, const ActivateIntent());
            });
          }
        });
      }
    });
  }

  onChanged(BuildContext context, String item) {
    switch (item) {
      case "PARTENAIRES":
        break;
    }
  }
}
