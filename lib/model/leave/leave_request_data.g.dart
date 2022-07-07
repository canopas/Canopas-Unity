// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequestData _$LeaveRequestDataFromJson(Map<String, dynamic> json) =>
    LeaveRequestData(
      uid: json['uid'] as String,
      leaveType: json['leave_type'] as int?,
      startDate: json['start_date'] as int,
      endDate: json['end_date'] as int,
      totalLeaves: (json['total_leaves'] as num).toDouble(),
      reason: json['reason'] as String,
      emergencyContactPerson: json['emergency_contact_person'] as int,
      leaveStatus: json['leave_status'] as int,
      reject: json['reject'] as String?,
    );

Map<String, dynamic> _$LeaveRequestDataToJson(LeaveRequestData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'leave_type': instance.leaveType,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_leaves': instance.totalLeaves,
      'reason': instance.reason,
      'emergency_contact_person': instance.emergencyContactPerson,
      'leave_status': instance.leaveStatus,
      'reject': instance.reject,
    };
