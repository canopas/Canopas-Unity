import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/core/extensions/date_time.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/leave/leave.dart';

@Injectable()
class AdminLeaveService {
  final _leaveDbCollection = FirebaseFirestore.instance
      .collection('leaves')
      .withConverter(
          fromFirestore: Leave.fromFireStore,
          toFirestore: (Leave leaveRequestData, _) =>
              leaveRequestData.toFireStore(leaveRequestData));

  Future<void> updateLeaveStatus(String id, Map<String, dynamic> map) async {
    await _leaveDbCollection.doc(id).update(map);
  }

  ValueStream<List<Leave>> getAllRequests() {
    final BehaviorSubject<List<Leave>> _leaves = BehaviorSubject<List<Leave>>();
    _leaveDbCollection.where('leave_status', isEqualTo: 1).snapshots().listen(
        (event) {
      final request = event.docs
          .map((doc) => doc.data())
          .where((element) => element.startDate.dateOnly
              .areSameOrUpcoming(DateTime.now().dateOnly))
          .toList();
      _leaves.add(request);
    }, onError: (error) {
      _leaves.addError(error);
    });
    return _leaves.stream;
  }

  Future<List<Leave>> getAllAbsence() async {
    int todayDate = DateTime.now().millisecondsSinceEpoch;
    final _data = await _leaveDbCollection
        .where('end_date', isGreaterThan: todayDate)
        .get();
    List<Leave> _leaves = <Leave>[];
    List _users = [];
    for (var e in _data.docs) {
      if (e.data().startDate < todayDate &&
          e.data().leaveStatus == approveLeaveStatus &&
          !_users.contains(e.data().uid)) {
        _users.add(e.data().uid);
        _leaves.add(e.data());
      }
    }
    return _leaves;
  }

  Future<int> getAbsenceCount() async {
    List<Leave> _leave = await getAllAbsence();
    return _leave.length;
  }

}
