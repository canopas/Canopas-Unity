import 'package:equatable/equatable.dart';
import '../../../../data/core/utils/bloc_status.dart';
import '../../../../data/model/space/space.dart';

class JoinSpaceState extends Equatable {
  final Status fetchSpaceStatus;
  final Status selectSpaceStatus;
  final List<Space> spaces;
  final String? error;

  const JoinSpaceState({
    this.selectSpaceStatus = Status.initial,
    this.fetchSpaceStatus = Status.initial,
    this.spaces = const [],
    this.error,
  });

  JoinSpaceState copyWith(
          {Status? fetchSpaceStatus,
          Status? selectSpaceStatus,
          List<Space>? spaces,
          String? error}) =>
      JoinSpaceState(
          error: error,
          selectSpaceStatus: selectSpaceStatus ?? this.selectSpaceStatus,
          fetchSpaceStatus: fetchSpaceStatus ?? this.fetchSpaceStatus,
          spaces: spaces ?? this.spaces);

  @override
  List<Object?> get props =>
      [fetchSpaceStatus, spaces, error, selectSpaceStatus];
}
