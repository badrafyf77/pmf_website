import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/custom_text_button.dart';
import 'package:pmf_website/core/utils/customs/laoding_indicator.dart';
import 'package:pmf_website/core/utils/customs/text_field.dart';
import 'package:pmf_website/core/utils/helpers/show_toast.dart';
import 'package:pmf_website/core/utils/helpers/validators.dart';
import 'package:pmf_website/features/auth/presentation/manager/auth%20bloc/auth_bloc.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({
    super.key,
  });

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            loading = true;
          });
        }
        if (state is AuthSuccess) {
          setState(() {
            loading = false;
            emailController.clear();
          });
          myShowToastSuccess(context, "Password reset link sent successfully");
        }
        if (state is AuthFailure) {
          setState(() {
            loading = false;
          });
          myShowToastError(context, state.errorMessage);
        }
      },
      child: loading
          ? const Center(child: CustomLoadingIndicator())
          : Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field required";
                      } else if (!isEmailValid(value)) {
                        return "Invalid email";
                      }
                      return null;
                    },
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          ForgotPassEvent(
                            email: emailController.text,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: const StadiumBorder(),
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    child: Text(
                      "Reset password".toUpperCase(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextButton(
                        text: "Back to log in",
                        onpressed: () {
                          AppRouter.navigateTo(context, AppRouter.signIn);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
