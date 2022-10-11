import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/core/extensions/date_time.dart';
import 'package:projectunity/model/leave/leave.dart';

@Singleton()
class UserLeaveService {
  final _leaveDbCollection = FirebaseFirestore.instance
      .collection('leaves')
      .withConverter(
          fromFirestore: Leave.fromFireStore,
          toFirestore: (Leave leave, _) => leave.toFireStore(leave));

  Future<void> applyForLeave(Leave leaveRequestData) async {
    final leaveUid = leaveRequestData.leaveId;
    _leaveDbCollection.doc(leaveUid).set(leaveRequestData);
  }

  Future<List<Leave>> getAllLeavesOfUser(String id) async {
    final data = await _leaveDbCollection.where('uid', isEqualTo: id).get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Leave>> getRequestedLeave(String id) async {
    final data = await _leaveDbCollection
        .where('uid', isEqualTo: id)
        .where('leave_status', isEqualTo: pendingLeaveStatus)
        .get();

    return data.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Leave>> getUpcomingLeaves(String employeeId) async {
    final data = await _leaveDbCollection
        .where('uid', isEqualTo: employeeId)
        .where('leave_status', isEqualTo: approveLeaveStatus)
        .get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  Future<void> deleteLeaveRequest(String leaveId) async {
    await _leaveDbCollection.doc(leaveId).delete();
  }

  Future<double> getUserUsedLeaveCount(String id) async {
    DateTime currentTime = DateTime.now();
    final data = await _leaveDbCollection
        .where('uid', isEqualTo: id)
        .where('leave_status', isEqualTo: approveLeaveStatus)
        .get();

    List<Leave> approvedLeaves = data.docs.map((doc) => doc.data()).toList();
    double _leaveCount = 0.0;

    approvedLeaves
        .where((element) =>
            element.startDate < currentTime.millisecondsSinceEpoch &&
            element.startDate.toDate.year == currentTime.year)
        .forEach((element) {
      _leaveCount += element.totalLeaves;
    });

    return _leaveCount;
  }
}
