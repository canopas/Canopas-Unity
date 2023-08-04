// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/user/members/detail/user_employee_detail_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/leave/leave.dart' as _i6;
import 'package:projectunity/data/model/pagination/pagination.dart' as _i3;
import 'package:projectunity/data/services/leave_service.dart' as _i4;

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

class _FakeFirebaseFirestore_0 extends _i1.SmartFake
    implements _i2.FirebaseFirestore {
  _FakeFirebaseFirestore_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePaginatedLeaves_1 extends _i1.SmartFake
    implements _i3.PaginatedLeaves {
  _FakePaginatedLeaves_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LeaveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaveService extends _i1.Mock implements _i4.LeaveService {
  MockLeaveService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseFirestore get fireStore => (super.noSuchMethod(
        Invocation.getter(#fireStore),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#fireStore),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  set fireStore(_i2.FirebaseFirestore? _fireStore) => super.noSuchMethod(
        Invocation.setter(
          #fireStore,
          _fireStore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get generateLeaveId => (super.noSuchMethod(
        Invocation.getter(#generateLeaveId),
        returnValue: '',
      ) as String);
  @override
  _i5.Stream<List<_i6.Leave>> allPendingLeaveRequests(
          {required String? spaceId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #allPendingLeaveRequests,
          [],
          {#spaceId: spaceId},
        ),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);
  @override
  _i5.Future<_i3.PaginatedLeaves> leaves({
    _i2.DocumentSnapshot<_i6.Leave>? lastDoc,
    String? uid,
    required String? spaceId,
    required int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaves,
          [],
          {
            #lastDoc: lastDoc,
            #uid: uid,
            #spaceId: spaceId,
            #limit: limit,
          },
        ),
        returnValue:
            _i5.Future<_i3.PaginatedLeaves>.value(_FakePaginatedLeaves_1(
          this,
          Invocation.method(
            #leaves,
            [],
            {
              #lastDoc: lastDoc,
              #uid: uid,
              #spaceId: spaceId,
              #limit: limit,
            },
          ),
        )),
      ) as _i5.Future<_i3.PaginatedLeaves>);
  @override
  _i5.Stream<List<_i6.Leave>> monthlyLeaveByStartDate({
    required int? year,
    required int? month,
    required String? spaceId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #monthlyLeaveByStartDate,
          [],
          {
            #year: year,
            #month: month,
            #spaceId: spaceId,
          },
        ),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);
  @override
  _i5.Stream<List<_i6.Leave>> monthlyLeaveByEndDate({
    required int? year,
    required int? month,
    required String? spaceId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #monthlyLeaveByEndDate,
          [],
          {
            #year: year,
            #month: month,
            #spaceId: spaceId,
          },
        ),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);
  @override
  _i5.Stream<List<_i6.Leave>> userLeaveByStatus({
    required String? uid,
    required _i6.LeaveStatus? status,
    required String? spaceId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #userLeaveByStatus,
          [],
          {
            #uid: uid,
            #status: status,
            #spaceId: spaceId,
          },
        ),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);
  @override
  _i5.Future<bool> checkLeaveAlreadyApplied({
    required String? userId,
    required Map<DateTime, _i6.LeaveDayDuration>? dateDuration,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkLeaveAlreadyApplied,
          [],
          {
            #userId: userId,
            #dateDuration: dateDuration,
          },
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> updateLeaveStatus({
    required String? id,
    required _i6.LeaveStatus? status,
    String? response = r'',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLeaveStatus,
          [],
          {
            #id: id,
            #status: status,
            #response: response,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> applyForLeave(_i6.Leave? leaveRequestData) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyForLeave,
          [leaveRequestData],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<List<_i6.Leave>> getUpcomingLeavesOfUser(String? employeeId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeavesOfUser,
          [employeeId],
        ),
        returnValue: _i5.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i5.Future<List<_i6.Leave>>);
  @override
  _i5.Future<double> getUserUsedLeaves(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getUserUsedLeaves,
          [id],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<_i6.Leave?> fetchLeave(String? leaveId) => (super.noSuchMethod(
        Invocation.method(
          #fetchLeave,
          [leaveId],
        ),
        returnValue: _i5.Future<_i6.Leave?>.value(),
      ) as _i5.Future<_i6.Leave?>);
}
