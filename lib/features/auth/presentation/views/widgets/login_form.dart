import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/laoding_indicator.dart';
import 'package:pmf_website/core/utils/customs/text_field.dart';
import 'package:pmf_website/core/utils/helpers/show_toast.dart';
import 'package:pmf_website/core/utils/helpers/validators.dart';
import 'package:pmf_website/features/auth/presentation/manager/auth%20bloc/auth_bloc.dart';

import 'already_have_an_account_acheck.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
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
        if (state is SignInSuccess) {
          setState(() {
            loading = false;
          });
          AppRouter.navigateToWithUrlParametre(
              context, AppRouter.profile, 'id', state.id);
        }
        if (state is AuthFailure) {
          setState(() {
            loading = false;
          });
          myShowToastError(context, state.errorMessage);
        }
      },
      child: loading
          ? const Center(child: LoadingCircle())
          : Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: MyTextField(
                      obscureText: true,
                      controller: passController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field required";
                        } else if (value.length < 8) {
                          return "Password too short";
                        }
                        return null;
                      },
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignInEvent(
                            email: emailController.text,
                            password: passController.text,
                          ),
                        );
                        setState(() {
                          passController.clear();
                        });
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
                      "Login".toUpperCase(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      AppRouter.navigateTo(context, AppRouter.signUp);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
