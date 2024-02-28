// Mocks generated by Mockito 5.4.4 from annotations
// in projectunity/test/unit_test/user/members/detail/user_employee_detail_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:projectunity/data/model/leave/leave.dart' as _i6;
import 'package:projectunity/data/model/leave_count.dart' as _i3;
import 'package:projectunity/data/model/pagination/pagination.dart' as _i2;
import 'package:projectunity/data/repo/leave_repo.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePaginatedLeaves_0 extends _i1.SmartFake
    implements _i2.PaginatedLeaves {
  _FakePaginatedLeaves_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLeaveCounts_1 extends _i1.SmartFake implements _i3.LeaveCounts {
  _FakeLeaveCounts_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LeaveRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaveRepo extends _i1.Mock implements _i4.LeaveRepo {
  MockLeaveRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<List<_i6.Leave>> get pendingLeaves => (super.noSuchMethod(
        Invocation.getter(#pendingLeaves),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);

  @override
  String get generateLeaveId => (super.noSuchMethod(
        Invocation.getter(#generateLeaveId),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#generateLeaveId),
        ),
      ) as String);

  @override
  _i5.Future<_i2.PaginatedLeaves> leaves({
    _i8.DocumentSnapshot<_i6.Leave>? lastDoc,
    String? uid,
    _i6.LeaveType? leaveType,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaves,
          [],
          {
            #lastDoc: lastDoc,
            #uid: uid,
            #leaveType: leaveType,
          },
        ),
        returnValue:
            _i5.Future<_i2.PaginatedLeaves>.value(_FakePaginatedLeaves_0(
          this,
          Invocation.method(
            #leaves,
            [],
            {
              #lastDoc: lastDoc,
              #uid: uid,
              #leaveType: leaveType,
            },
          ),
        )),
      ) as _i5.Future<_i2.PaginatedLeaves>);

  @override
  _i5.Stream<List<_i6.Leave>> userLeaveRequest(String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #userLeaveRequest,
          [uid],
        ),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);

  @override
  _i5.Stream<List<_i6.Leave>> leaveByMonth(DateTime? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaveByMonth,
          [date],
        ),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);

  @override
  _i5.Future<bool> checkLeaveAlreadyApplied({
    required String? uid,
    required Map<DateTime, _i6.LeaveDayDuration>? dateDuration,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkLeaveAlreadyApplied,
          [],
          {
            #uid: uid,
            #dateDuration: dateDuration,
          },
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<void> updateLeaveStatus({
    required String? leaveId,
    required _i6.LeaveStatus? status,
    String? response = r'',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLeaveStatus,
          [],
          {
            #leaveId: leaveId,
            #status: status,
            #response: response,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> applyForLeave({required _i6.Leave? leave}) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyForLeave,
          [],
          {#leave: leave},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<List<_i6.Leave>> getUpcomingLeavesOfUser({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeavesOfUser,
          [],
          {#uid: uid},
        ),
        returnValue: _i5.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i5.Future<List<_i6.Leave>>);

  @override
  _i5.Future<_i3.LeaveCounts> getUserUsedLeaves({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserUsedLeaves,
          [],
          {#uid: uid},
        ),
        returnValue: _i5.Future<_i3.LeaveCounts>.value(_FakeLeaveCounts_1(
          this,
          Invocation.method(
            #getUserUsedLeaves,
            [],
            {#uid: uid},
          ),
        )),
      ) as _i5.Future<_i3.LeaveCounts>);

  @override
  _i5.Future<_i6.Leave?> fetchLeave({required String? leaveId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchLeave,
          [],
          {#leaveId: leaveId},
        ),
        returnValue: _i5.Future<_i6.Leave?>.value(),
      ) as _i5.Future<_i6.Leave?>);
}
