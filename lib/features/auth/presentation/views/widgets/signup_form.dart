import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/laoding_indicator.dart';
import 'package:pmf_website/core/utils/customs/text_field.dart';
import 'package:pmf_website/core/utils/helpers/show_toast.dart';
import 'package:pmf_website/core/utils/helpers/validators.dart';
import 'package:pmf_website/features/auth/presentation/manager/auth%20bloc/auth_bloc.dart';
import 'package:pmf_website/features/auth/presentation/views/widgets/already_have_an_account_acheck.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmationPassController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool loading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmationPassController.dispose();
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
          });
          myShowToastSuccess(context, "Account created! You can now log in.");
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
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field required";
                      }
                      return null;
                    },
                    hintText: "Display name",
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 16.0),
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
                  const SizedBox(height: 16.0),
                  MyTextField(
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
                  const SizedBox(height: 16.0),
                  MyTextField(
                    obscureText: true,
                    controller: confirmationPassController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field required";
                      } else if (value != passController.text) {
                        return "Passwords don't match";
                      }
                      return null;
                    },
                    hintText: "Password confirmation",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignUpEvent(
                            displayName: nameController.text,
                            email: emailController.text,
                            password: passController.text,
                          ),
                        );
                        setState(() {
                          nameController.clear();
                          emailController.clear();
                          passController.clear();
                          confirmationPassController.clear();
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
                      "Sign Up".toUpperCase(),
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
            ),
    );
  }
}
