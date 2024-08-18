import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/features/profile/data/repo/profile_repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  final ProfileRepo _profileRepo;
  GetUserInfoCubit(this._profileRepo) : super(GetUserInfoInitial());

  Future<void> getUser(String id) async {
    emit(GetUserInfoLaoding());
    var result = await _profileRepo.getUser(id);
    result.fold(
      (left) => emit(
        GetUserInfoFailure(err: left.errMessage),
      ),
      (right) => emit(
        GetUserInfoSuccess(userInformation: right),
      ),
    );
  }
}
