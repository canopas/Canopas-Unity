// Mocks generated by Mockito 5.3.2 from annotations
// in projectunity/test/unit_test/admin/home/bloc/admin_home_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/model/employee/employee.dart' as _i4;
import 'package:projectunity/model/leave/leave.dart' as _i6;
import 'package:projectunity/services/admin/employee/employee_service.dart'
    as _i2;
import 'package:projectunity/services/admin/paid_leave/paid_leave_service.dart'
    as _i7;
import 'package:projectunity/services/admin/requests/admin_leave_service.dart'
    as _i5;
import 'package:projectunity/services/leave/user_leave_service.dart' as _i8;

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

/// A class which mocks [EmployeeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmployeeService extends _i1.Mock implements _i2.EmployeeService {
  MockEmployeeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i4.Employee>> get getEmployeeStream => (super.noSuchMethod(
        Invocation.getter(#getEmployeeStream),
        returnValue: _i3.Stream<List<_i4.Employee>>.empty(),
      ) as _i3.Stream<List<_i4.Employee>>);
  @override
  _i3.Future<List<_i4.Employee>> getEmployees() => (super.noSuchMethod(
        Invocation.method(
          #getEmployees,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Employee>>.value(<_i4.Employee>[]),
      ) as _i3.Future<List<_i4.Employee>>);
  @override
  _i3.Future<_i4.Employee?> getEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getEmployee,
          [id],
        ),
        returnValue: _i3.Future<_i4.Employee?>.value(),
      ) as _i3.Future<_i4.Employee?>);
  @override
  _i3.Future<bool> hasUser(String? email) => (super.noSuchMethod(
        Invocation.method(
          #hasUser,
          [email],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<void> addEmployee(_i4.Employee? employee) => (super.noSuchMethod(
        Invocation.method(
          #addEmployee,
          [employee],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> changeEmployeeRoleType(
    String? id,
    int? roleType,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeEmployeeRoleType,
          [
            id,
            roleType,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteEmployee,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AdminLeaveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdminLeaveService extends _i1.Mock implements _i5.AdminLeaveService {
  MockAdminLeaveService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i6.Leave>> get getLeaveStream => (super.noSuchMethod(
        Invocation.getter(#getLeaveStream),
        returnValue: _i3.Stream<List<_i6.Leave>>.empty(),
      ) as _i3.Stream<List<_i6.Leave>>);
  @override
  _i3.Future<void> updateLeaveStatus(
    String? id,
    Map<String, dynamic>? map,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLeaveStatus,
          [
            id,
            map,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<List<_i6.Leave>> getAllLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getAllLeaves,
          [],
        ),
        returnValue: _i3.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i3.Future<List<_i6.Leave>>);
  @override
  _i3.Future<List<_i6.Leave>> getAllAbsence() => (super.noSuchMethod(
        Invocation.method(
          #getAllAbsence,
          [],
        ),
        returnValue: _i3.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i3.Future<List<_i6.Leave>>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [PaidLeaveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPaidLeaveService extends _i1.Mock implements _i7.PaidLeaveService {
  MockPaidLeaveService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> getPaidLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getPaidLeaves,
          [],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<void> updateLeaveCount(int? leaveCount) => (super.noSuchMethod(
        Invocation.method(
          #updateLeaveCount,
          [leaveCount],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [UserLeaveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLeaveService extends _i1.Mock implements _i8.UserLeaveService {
  MockUserLeaveService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> applyForLeave(_i6.Leave? leaveRequestData) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyForLeave,
          [leaveRequestData],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<List<_i6.Leave>> getAllLeavesOfUser(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllLeavesOfUser,
          [id],
        ),
        returnValue: _i3.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i3.Future<List<_i6.Leave>>);
  @override
  _i3.Future<List<_i6.Leave>> getRequestedLeave(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRequestedLeave,
          [id],
        ),
        returnValue: _i3.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i3.Future<List<_i6.Leave>>);
  @override
  _i3.Future<List<_i6.Leave>> getUpcomingLeaves(String? employeeId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeaves,
          [employeeId],
        ),
        returnValue: _i3.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i3.Future<List<_i6.Leave>>);
  @override
  _i3.Future<void> deleteLeaveRequest(String? leaveId) => (super.noSuchMethod(
        Invocation.method(
          #deleteLeaveRequest,
          [leaveId],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<double> getUserUsedLeaveCount(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getUserUsedLeaveCount,
          [id],
        ),
        returnValue: _i3.Future<double>.value(0.0),
      ) as _i3.Future<double>);
  @override
  _i3.Future<void> deleteAllLeaves(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteAllLeaves,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
