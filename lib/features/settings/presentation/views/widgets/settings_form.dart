import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/core/services/auth_service.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/customs/custom_text_button.dart';
import 'package:pmf_website/core/utils/helpers/validators.dart';
import 'package:pmf_website/features/settings/presentation/manager/cubit/settings_cubit.dart';
import 'package:pmf_website/features/settings/presentation/views/widgets/textfield_title_button.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key, required this.user});

  final UserInformation user;

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

  bool nameEnable = false;
  bool emailEnable = false;

  @override
  void initState() {
    displayNameController.text = widget.user.displayName;
    emailController.text = widget.user.email;
    super.initState();
  }

  @override
  void dispose() {
    displayNameController.dispose();
    currentPassController.dispose();
    emailController.dispose();
    newPassController.dispose();
    super.dispose();
  }

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
                  enabled: nameEnable,
                  title: "  Display name",
                  controller: displayNameController,
                  onChanged: (value) {
                    if (value != widget.user.displayName) {
                      setState(() {
                        nameEnable = true;
                      });
                    } else {
                      setState(() {
                        nameEnable = false;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!containsNumbers(value)) {
                      return "The name cannot contain numbers";
                    } else if (value.length > 50) {
                      return "The name is too long";
                    }
                    return null;
                  },
                  hintText: "display name",
                  onpressed: () async {
                    if (form1Key.currentState!.validate() &&
                        form2Key.currentState!.validate()) {
                      BlocProvider.of<SettingsCubit>(context)
                          .changeName(widget.user, displayNameController.text);
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: form2Key,
                child: TextFieldWithTitleAndButton(
                  enabled: true,
                  obscureText: true,
                  title: "  Current password",
                  controller: currentPassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 8) {
                      return 'Passowrd too short';
                    } else if (value != widget.user.password) {
                      return 'The password you entered is incorrect';
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
                  enabled: emailEnable,
                  title: "  Email",
                  controller: emailController,
                  onChanged: (value) {
                    if (value != widget.user.email) {
                      setState(() {
                        emailEnable = true;
                      });
                    } else {
                      setState(() {
                        emailEnable = false;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!isEmailValid(value)) {
                      return 'Enter an valid email';
                    }
                    return null;
                  },
                  hintText: "email",
                  onpressed: () async {
                    if (form3Key.currentState!.validate() &&
                        form2Key.currentState!.validate()) {
                      BlocProvider.of<SettingsCubit>(context)
                          .changeEmail(widget.user, emailController.text);
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: form4Key,
                child: TextFieldWithTitleAndButton(
                  enabled: true,
                  obscureText: true,
                  title: "  New password",
                  controller: newPassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 8) {
                      return 'Passowrd too short';
                    } else if (newPassController.text == widget.user.password) {
                      return "The new password cannot be the same as the old password";
                    }
                    return null;
                  },
                  hintText: "new password",
                  onpressed: () {
                    if (form4Key.currentState!.validate() &&
                        form2Key.currentState!.validate()) {
                      BlocProvider.of<SettingsCubit>(context)
                          .changePass(widget.user, newPassController.text);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              text: "Reset password",
              onpressed: () {
                BlocProvider.of<SettingsCubit>(context)
                    .sendPasswordReset(widget.user);
              },
            ),
            const SizedBox(width: 20),
            CustomButton(
              onPressed: () {
                AuthService().signOut();
                AppRouter.navigateTo(context, AppRouter.home);
              },
              textButton: "Log out",
              backgroundColor: AppColors.kPrimaryColor,
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
