import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/laoding_indicator.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/core/utils/customs/views_title.dart';
import 'package:pmf_website/core/utils/helpers/show_toast.dart';
import 'package:pmf_website/features/settings/presentation/manager/cubit/settings_cubit.dart';
import 'package:pmf_website/features/settings/presentation/views/widgets/settings_form.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            const ViewsTitle(
              title: "Account",
            ),
            const SizedBox(height: 25),
            BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) {
                if (state is SettingsFailure) {
                  myShowToastError(context, state.err);
                }
                if (state is SendPasswordResetSuccess) {
                  myShowToastSuccess(
                      context, "Password reset link sent successfully");
                  BlocProvider.of<SettingsCubit>(context).getUser(id);
                }
                if (state is ChangeEmailSuccess) {
                  myShowToastSuccess(
                      context, "Your email has been updated successfully");
                  BlocProvider.of<SettingsCubit>(context).getUser(id);
                }
                if (state is ChangeNameSuccess) {
                  myShowToastSuccess(
                      context, "Your name has been updated successfully");
                  BlocProvider.of<SettingsCubit>(context).getUser(id);
                }
                if (state is ChangePassSuccess) {
                  myShowToastSuccess(
                      context, "Your password has been updated successfully");
                  BlocProvider.of<SettingsCubit>(context).getUser(id);
                }
              },
              builder: (context, state) {
                if (state is SettingsFailure) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<SettingsCubit>(context).getUser(id);
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  );
                } else if (state is GetUserSuccess) {
                  return SettingsForm(
                    user: state.userInformation,
                  );
                }
                return const Center(
                  child: CustomLoadingIndicator(),
                );
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ],
    );
  }
}