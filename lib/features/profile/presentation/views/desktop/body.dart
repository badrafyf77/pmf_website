import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/core/utils/service_locator.dart';
import 'package:pmf_website/features/profile/presentation/manager/get%20user%20info%20cubit/get_user_info_cubit.dart';
import 'package:pmf_website/features/profile/presentation/views/widgets/user_profile.dart';

class DesktopProfileBody extends StatelessWidget {
  const DesktopProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            BlocConsumer<GetUserInfoCubit, GetUserInfoState>(
              listener: (context, state) {
                if (state is GetUserInfoFailure) {
                  AppRouter.navigateTo(context, AppRouter.home);
                }
              },
              builder: (context, state) {
                if (state is GetUserInfoSuccess) {
                  return UserProfile(
                    user: state.userInformation,
                  );
                }
                return UserProfile(
                  isLaoding: true,
                  user: getIt.get<UserInformation>(),
                );
              },
            ),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}
