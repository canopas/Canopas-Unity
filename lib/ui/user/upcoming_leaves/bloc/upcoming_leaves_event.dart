import 'package:equatable/equatable.dart';
import '../../../../model/leave_application.dart';

abstract class UpcomingLeavesViewEvents extends Equatable{}

class UpcomingLeavesViewInitialLoadEvent extends UpcomingLeavesViewEvents{
  @override
  List<Object?> get props => [];
}

class RemoveLeaveApplicationOnUpcomingLeavesEvent extends UpcomingLeavesViewEvents {
  final LeaveApplication leaveApplication;
  RemoveLeaveApplicationOnUpcomingLeavesEvent(this.leaveApplication);
  @override
  List<Object?> get props => [leaveApplication];
}

