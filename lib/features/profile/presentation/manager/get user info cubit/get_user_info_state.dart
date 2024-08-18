part of 'get_user_info_cubit.dart';

abstract class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLaoding extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserInformation userInformation;

  GetUserInfoSuccess({required this.userInformation});
}

final class GetUserInfoFailure extends GetUserInfoState {
  final String err;

  GetUserInfoFailure({required this.err});
}
