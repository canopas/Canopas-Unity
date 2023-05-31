import 'package:flutter/material.dart';
import '../../../configs/colors.dart';
import '../../../model/leave/leave.dart';

Color leaveStatusColor(LeaveStatus leaveStatus) {
  if (leaveStatus == LeaveStatus.approved) {
    return const Color(0xffB6F5D4);
  } else if (leaveStatus == LeaveStatus.pending) {
    return const Color(0xffF5F5F5);
  }
  return const Color(0xffFFE5E1);
}

Map<int, String> leaveTypeMap = Map.unmodifiable({
  0: 'Casual Leave',
  1: 'Sick Leave',
  2: 'Annual Leave',
  3: 'Paternity Leave',
  4: 'Maternity Leave',
  5: 'Marriage Leave',
  6: 'Bereavement Leave'
});

Map<int, Color> leaveRequestCardColor = Map.unmodifiable({
  0: AppColors.primaryGreen,
  1: AppColors.orangeColor,
  2: AppColors.primaryDarkYellow,
  3: AppColors.greyColor,
  4: AppColors.primaryPink,
  5: AppColors.primaryBlue,
  6: AppColors.darkBlue,
});
