import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/text_field.dart';
import 'package:pmf_website/features/auth/presentation/views/widgets/already_have_an_account_acheck.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          MyTextField(
            controller: controller,
            validator: (validator) {
              return 'd';
            },
            hintText: "Your email",
            prefixIcon: const Icon(Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: MyTextField(
              controller: controller,
              validator: (validator) {
                return 'd';
              },
              hintText: "Your password",
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.black,
              backgroundColor: AppColors.kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: 16.0),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              AppRouter.navigateTo(context, AppRouter.signIn);
            },
          ),
        ],
      ),
    );
  }
}
