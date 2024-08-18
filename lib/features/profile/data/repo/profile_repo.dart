import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/utils/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserInformation>> getUser(String id);
}
