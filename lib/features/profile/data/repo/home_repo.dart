import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/models/event_model.dart';
import 'package:pmf_website/core/utils/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, Event>> getInitialEvent();
}
