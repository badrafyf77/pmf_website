import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/custom_text_button.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/core/utils/customs/text_field.dart';
import 'package:pmf_website/core/utils/customs/views_title.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      desktopBody: const SettingsBody(),
      tabletBody: const SettingsBody(),
      mobileBody: const SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            ViewsTitle(
              title: "Account",
            ),
            SizedBox(height: 25),
            SettingsForm(),
            SizedBox(height: 25),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  GlobalKey<FormState> form1Key = GlobalKey();
  GlobalKey<FormState> form2Key = GlobalKey();
  GlobalKey<FormState> form3Key = GlobalKey();
  GlobalKey<FormState> form4Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1),
          child: Column(
            children: [
              Form(
                key: form1Key,
                child: TextFieldWithTitleAndButton(
                  title: "  Display name",
                  controller: displayNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  hintText: "display name",
                  onpressed: () {
                    if (form1Key.currentState!.validate() &&
                        form2Key.currentState!.validate()) {}
                  },
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: form2Key,
                child: TextFieldWithTitleAndButton(
                  title: "  Current password",
                  controller: currentPassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  hintText: "current password",
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: form3Key,
                child: TextFieldWithTitleAndButton(
                  title: "  Email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  hintText: "email",
                  onpressed: () {
                    if (form3Key.currentState!.validate() &&
                        form2Key.currentState!.validate()) {}
                  },
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: form4Key,
                child: TextFieldWithTitleAndButton(
                  title: "  New password",
                  controller: newPassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  hintText: "new password",
                  onpressed: () {
                    if (form4Key.currentState!.validate() &&
                        form2Key.currentState!.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        CustomTextButton(
          text: "Reset password",
          onpressed: () {},
        ),
      ],
    );
  }
}

class TextFieldWithTitleAndButton extends StatelessWidget {
  const TextFieldWithTitleAndButton({
    super.key,
    required this.controller,
    required this.title,
    required this.validator,
    required this.hintText,
    this.onpressed,
  });

  final String title;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final void Function()? onpressed;

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
          controller: controller,
          validator: validator,
          hintText: hintText,
        ),
        if (onpressed != null)
          CustomTextButton(
            text: "Change",
            onpressed: onpressed,
          ),
      ],
    );
  }
}
