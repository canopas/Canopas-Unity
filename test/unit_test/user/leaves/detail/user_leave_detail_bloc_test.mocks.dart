// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/user/leaves/detail/user_leave_detail_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/leave/leave.dart' as _i5;
import 'package:projectunity/data/model/pagination/pagination.dart' as _i2;
import 'package:projectunity/data/repo/leave_repo.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
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

/// A class which mocks [LeaveRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaveRepo extends _i1.Mock implements _i3.LeaveRepo {
  MockLeaveRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<List<_i5.Leave>> get pendingLeaves => (super.noSuchMethod(
        Invocation.getter(#pendingLeaves),
        returnValue: _i4.Stream<List<_i5.Leave>>.empty(),
      ) as _i4.Stream<List<_i5.Leave>>);
  @override
  String get generateLeaveId => (super.noSuchMethod(
        Invocation.getter(#generateLeaveId),
        returnValue: '',
      ) as String);
  @override
  _i4.Future<_i2.PaginatedLeaves> leaves({
    _i6.DocumentSnapshot<_i5.Leave>? lastDoc,
    String? uid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaves,
          [],
          {
            #lastDoc: lastDoc,
            #uid: uid,
          },
        ),
        returnValue:
            _i4.Future<_i2.PaginatedLeaves>.value(_FakePaginatedLeaves_0(
          this,
          Invocation.method(
            #leaves,
            [],
            {
              #lastDoc: lastDoc,
              #uid: uid,
            },
          ),
        )),
      ) as _i4.Future<_i2.PaginatedLeaves>);
  @override
  _i4.Stream<List<_i5.Leave>> userLeaveRequest(String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #userLeaveRequest,
          [uid],
        ),
        returnValue: _i4.Stream<List<_i5.Leave>>.empty(),
      ) as _i4.Stream<List<_i5.Leave>>);
  @override
  _i4.Stream<List<_i5.Leave>> leaveByMonth(DateTime? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaveByMonth,
          [date],
        ),
        returnValue: _i4.Stream<List<_i5.Leave>>.empty(),
      ) as _i4.Stream<List<_i5.Leave>>);
  @override
  _i4.Future<bool> checkLeaveAlreadyApplied({
    required String? uid,
    required Map<DateTime, _i5.LeaveDayDuration>? dateDuration,
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
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<void> updateLeaveStatus({
    required String? leaveId,
    required _i5.LeaveStatus? status,
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> applyForLeave({required _i5.Leave? leave}) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyForLeave,
          [],
          {#leave: leave},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<List<_i5.Leave>> getUpcomingLeavesOfUser({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeavesOfUser,
          [],
          {#uid: uid},
        ),
        returnValue: _i4.Future<List<_i5.Leave>>.value(<_i5.Leave>[]),
      ) as _i4.Future<List<_i5.Leave>>);
  @override
  _i4.Future<double> getUserUsedLeaves({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserUsedLeaves,
          [],
          {#uid: uid},
        ),
        returnValue: _i4.Future<double>.value(0.0),
      ) as _i4.Future<double>);
  @override
  _i4.Future<_i5.Leave?> fetchLeave({required String? leaveId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchLeave,
          [],
          {#leaveId: leaveId},
        ),
        returnValue: _i4.Future<_i5.Leave?>.value(),
      ) as _i4.Future<_i5.Leave?>);
}
