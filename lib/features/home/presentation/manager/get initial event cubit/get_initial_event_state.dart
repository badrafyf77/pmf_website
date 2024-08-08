part of 'get_initial_event_cubit.dart';

@immutable
abstract class GetInitialEventState {}

final class GetInitialEventInitial extends GetInitialEventState {}

final class GetInitialEventLoading extends GetInitialEventState {}

final class GetInitialEventSuccess extends GetInitialEventState {
  final Event event;

  GetInitialEventSuccess({required this.event});
}

final class GetInitialEventFailure extends GetInitialEventState {
  final String err;

  GetInitialEventFailure({required this.err});
}
