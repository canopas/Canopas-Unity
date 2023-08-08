// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/admin/home/home_screen/admin_home_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/employee/employee.dart' as _i6;
import 'package:projectunity/data/model/leave/leave.dart' as _i8;
import 'package:projectunity/data/model/leave_count.dart' as _i3;
import 'package:projectunity/data/model/pagination/pagination.dart' as _i2;
import 'package:projectunity/data/repo/employee_repo.dart' as _i4;
import 'package:projectunity/data/repo/leave_repo.dart' as _i7;

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

class _FakeLeaveCounts_1 extends _i1.SmartFake implements _i3.LeaveCounts {
  _FakeLeaveCounts_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EmployeeRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmployeeRepo extends _i1.Mock implements _i4.EmployeeRepo {
  MockEmployeeRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<List<_i6.Employee>> get employees => (super.noSuchMethod(
        Invocation.getter(#employees),
        returnValue: _i5.Stream<List<_i6.Employee>>.empty(),
      ) as _i5.Stream<List<_i6.Employee>>);
  @override
  List<_i6.Employee> get allEmployees => (super.noSuchMethod(
        Invocation.getter(#allEmployees),
        returnValue: <_i6.Employee>[],
      ) as List<_i6.Employee>);
  @override
  _i5.Stream<List<_i6.Employee>> get activeEmployees => (super.noSuchMethod(
        Invocation.getter(#activeEmployees),
        returnValue: _i5.Stream<List<_i6.Employee>>.empty(),
      ) as _i5.Stream<List<_i6.Employee>>);
  @override
  _i5.Stream<_i6.Employee?> memberDetails(String? uid) => (super.noSuchMethod(
        Invocation.method(
          #memberDetails,
          [uid],
        ),
        returnValue: _i5.Stream<_i6.Employee?>.empty(),
      ) as _i5.Stream<_i6.Employee?>);
  @override
  _i5.Future<void> reset() => (super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [LeaveRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaveRepo extends _i1.Mock implements _i7.LeaveRepo {
  MockLeaveRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<List<_i8.Leave>> get pendingLeaves => (super.noSuchMethod(
        Invocation.getter(#pendingLeaves),
        returnValue: _i5.Stream<List<_i8.Leave>>.empty(),
      ) as _i5.Stream<List<_i8.Leave>>);
  @override
  String get generateLeaveId => (super.noSuchMethod(
        Invocation.getter(#generateLeaveId),
        returnValue: '',
      ) as String);
  @override
  _i5.Future<_i2.PaginatedLeaves> leaves({
    _i9.DocumentSnapshot<_i8.Leave>? lastDoc,
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
            _i5.Future<_i2.PaginatedLeaves>.value(_FakePaginatedLeaves_0(
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
      ) as _i5.Future<_i2.PaginatedLeaves>);
  @override
  _i5.Stream<List<_i8.Leave>> userLeaveRequest(String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #userLeaveRequest,
          [uid],
        ),
        returnValue: _i5.Stream<List<_i8.Leave>>.empty(),
      ) as _i5.Stream<List<_i8.Leave>>);
  @override
  _i5.Stream<List<_i8.Leave>> leaveByMonth(DateTime? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaveByMonth,
          [date],
        ),
        returnValue: _i5.Stream<List<_i8.Leave>>.empty(),
      ) as _i5.Stream<List<_i8.Leave>>);
  @override
  _i5.Future<bool> checkLeaveAlreadyApplied({
    required String? uid,
    required Map<DateTime, _i8.LeaveDayDuration>? dateDuration,
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
    required _i8.LeaveStatus? status,
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
  _i5.Future<void> applyForLeave({required _i8.Leave? leave}) =>
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
  _i5.Future<List<_i8.Leave>> getUpcomingLeavesOfUser({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeavesOfUser,
          [],
          {#uid: uid},
        ),
        returnValue: _i5.Future<List<_i8.Leave>>.value(<_i8.Leave>[]),
      ) as _i5.Future<List<_i8.Leave>>);
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
  _i5.Future<_i8.Leave?> fetchLeave({required String? leaveId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchLeave,
          [],
          {#leaveId: leaveId},
        ),
        returnValue: _i5.Future<_i8.Leave?>.value(),
      ) as _i5.Future<_i8.Leave?>);
}
