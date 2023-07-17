// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/admin/member/detail/employee_detail_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i14;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/account/account.dart' as _i4;
import 'package:projectunity/data/model/employee/employee.dart' as _i5;
import 'package:projectunity/data/model/leave/leave.dart' as _i11;
import 'package:projectunity/data/model/space/space.dart' as _i13;
import 'package:projectunity/data/provider/device_info.dart' as _i3;
import 'package:projectunity/data/provider/user_state.dart' as _i12;
import 'package:projectunity/data/services/account_service.dart' as _i6;
import 'package:projectunity/data/services/employee_service.dart' as _i9;
import 'package:projectunity/data/services/leave_service.dart' as _i10;
import 'package:projectunity/data/services/space_service.dart' as _i15;

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

class _FakeDeviceInfoProvider_1 extends _i1.SmartFake
    implements _i3.DeviceInfoProvider {
  _FakeDeviceInfoProvider_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAccount_2 extends _i1.SmartFake implements _i4.Account {
  _FakeAccount_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEmployee_3 extends _i1.SmartFake implements _i5.Employee {
  _FakeEmployee_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AccountService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountService extends _i1.Mock implements _i6.AccountService {
  MockAccountService() {
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
  _i3.DeviceInfoProvider get deviceInfoProvider => (super.noSuchMethod(
        Invocation.getter(#deviceInfoProvider),
        returnValue: _FakeDeviceInfoProvider_1(
          this,
          Invocation.getter(#deviceInfoProvider),
        ),
      ) as _i3.DeviceInfoProvider);
  @override
  _i7.Future<_i4.Account> getUser(_i8.User? authData) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [authData],
        ),
        returnValue: _i7.Future<_i4.Account>.value(_FakeAccount_2(
          this,
          Invocation.method(
            #getUser,
            [authData],
          ),
        )),
      ) as _i7.Future<_i4.Account>);
  @override
  _i7.Future<void> updateSpaceOfUser({
    required String? spaceID,
    required String? uid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSpaceOfUser,
          [],
          {
            #spaceID: spaceID,
            #uid: uid,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteSpaceIdFromAccount({
    required String? spaceId,
    required String? uid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteSpaceIdFromAccount,
          [],
          {
            #spaceId: spaceId,
            #uid: uid,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<List<String>> fetchSpaceIds({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSpaceIds,
          [],
          {#uid: uid},
        ),
        returnValue: _i7.Future<List<String>>.value(<String>[]),
      ) as _i7.Future<List<String>>);
}

/// A class which mocks [EmployeeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmployeeService extends _i1.Mock implements _i9.EmployeeService {
  MockEmployeeService() {
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
  _i7.Stream<List<_i5.Employee>> employees(String? spaceId) =>
      (super.noSuchMethod(
        Invocation.method(
          #employees,
          [spaceId],
        ),
        returnValue: _i7.Stream<List<_i5.Employee>>.empty(),
      ) as _i7.Stream<List<_i5.Employee>>);
  @override
  _i7.Future<void> addEmployeeBySpaceId({
    required _i5.Employee? employee,
    required String? spaceId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addEmployeeBySpaceId,
          [],
          {
            #employee: employee,
            #spaceId: spaceId,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<_i5.Employee?> getEmployeeBySpaceId({
    required String? userId,
    required String? spaceId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEmployeeBySpaceId,
          [],
          {
            #userId: userId,
            #spaceId: spaceId,
          },
        ),
        returnValue: _i7.Future<_i5.Employee?>.value(),
      ) as _i7.Future<_i5.Employee?>);
  @override
  _i7.Future<List<_i5.Employee>> getEmployees() => (super.noSuchMethod(
        Invocation.method(
          #getEmployees,
          [],
        ),
        returnValue: _i7.Future<List<_i5.Employee>>.value(<_i5.Employee>[]),
      ) as _i7.Future<List<_i5.Employee>>);
  @override
  _i7.Future<_i5.Employee?> getEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getEmployee,
          [id],
        ),
        returnValue: _i7.Future<_i5.Employee?>.value(),
      ) as _i7.Future<_i5.Employee?>);
  @override
  _i7.Future<bool> hasUser(String? email) => (super.noSuchMethod(
        Invocation.method(
          #hasUser,
          [email],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<void> addEmployee(_i5.Employee? employee) => (super.noSuchMethod(
        Invocation.method(
          #addEmployee,
          [employee],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> updateEmployeeDetails({required _i5.Employee? employee}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateEmployeeDetails,
          [],
          {#employee: employee},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> changeEmployeeRoleType(
    String? id,
    _i5.Role? role,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeEmployeeRoleType,
          [
            id,
            role,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteEmployee,
          [id],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> changeAccountStatus({
    required String? id,
    required _i5.EmployeeStatus? status,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeAccountStatus,
          [],
          {
            #id: id,
            #status: status,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [LeaveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaveService extends _i1.Mock implements _i10.LeaveService {
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
  _i7.Stream<List<_i11.Leave>> get leaves => (super.noSuchMethod(
        Invocation.getter(#leaves),
        returnValue: _i7.Stream<List<_i11.Leave>>.empty(),
      ) as _i7.Stream<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getLeaveRequestOfUsers() => (super.noSuchMethod(
        Invocation.method(
          #getLeaveRequestOfUsers,
          [],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<bool> checkLeaveAlreadyApplied({
    required String? userId,
    required Map<DateTime, _i11.LeaveDayDuration>? dateDuration,
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
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<List<_i11.Leave>> getRecentLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getRecentLeaves,
          [],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getUpcomingLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeaves,
          [],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<void> updateLeaveStatus({
    required String? id,
    required _i11.LeaveStatus? status,
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
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<List<_i11.Leave>> getAllLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getAllLeaves,
          [],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getAllApprovedLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getAllApprovedLeaves,
          [],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getAllAbsence({DateTime? date}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllAbsence,
          [],
          {#date: date},
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  String getNewLeaveId() => (super.noSuchMethod(
        Invocation.method(
          #getNewLeaveId,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  _i7.Future<void> applyForLeave(_i11.Leave? leaveRequestData) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyForLeave,
          [leaveRequestData],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<List<_i11.Leave>> getAllLeavesOfUser(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllLeavesOfUser,
          [id],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getRecentLeavesOfUser(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecentLeavesOfUser,
          [id],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getRequestedLeave(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRequestedLeave,
          [id],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<List<_i11.Leave>> getUpcomingLeavesOfUser(String? employeeId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingLeavesOfUser,
          [employeeId],
        ),
        returnValue: _i7.Future<List<_i11.Leave>>.value(<_i11.Leave>[]),
      ) as _i7.Future<List<_i11.Leave>>);
  @override
  _i7.Future<void> deleteLeaveRequest(String? leaveId) => (super.noSuchMethod(
        Invocation.method(
          #deleteLeaveRequest,
          [leaveId],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<double> getUserUsedLeaves(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getUserUsedLeaves,
          [id],
        ),
        returnValue: _i7.Future<double>.value(0.0),
      ) as _i7.Future<double>);
  @override
  _i7.Future<void> deleteAllLeavesOfUser(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteAllLeavesOfUser,
          [id],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<_i11.Leave?> fetchLeave(String? leaveId) => (super.noSuchMethod(
        Invocation.method(
          #fetchLeave,
          [leaveId],
        ),
        returnValue: _i7.Future<_i11.Leave?>.value(),
      ) as _i7.Future<_i11.Leave?>);
}

/// A class which mocks [UserStateNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserStateNotifier extends _i1.Mock implements _i12.UserStateNotifier {
  MockUserStateNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.UserState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i12.UserState.authenticated,
      ) as _i12.UserState);
  @override
  String get employeeId => (super.noSuchMethod(
        Invocation.getter(#employeeId),
        returnValue: '',
      ) as String);
  @override
  _i5.Employee get employee => (super.noSuchMethod(
        Invocation.getter(#employee),
        returnValue: _FakeEmployee_3(
          this,
          Invocation.getter(#employee),
        ),
      ) as _i5.Employee);
  @override
  bool get isAdmin => (super.noSuchMethod(
        Invocation.getter(#isAdmin),
        returnValue: false,
      ) as bool);
  @override
  bool get isEmployee => (super.noSuchMethod(
        Invocation.getter(#isEmployee),
        returnValue: false,
      ) as bool);
  @override
  bool get isSpaceOwner => (super.noSuchMethod(
        Invocation.getter(#isSpaceOwner),
        returnValue: false,
      ) as bool);
  @override
  bool get isHR => (super.noSuchMethod(
        Invocation.getter(#isHR),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void getUserStatus() => super.noSuchMethod(
        Invocation.method(
          #getUserStatus,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<void> setUser(_i4.Account? user) => (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> setEmployeeWithSpace({
    required _i13.Space? space,
    required _i5.Employee? spaceUser,
    bool? redirect = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setEmployeeWithSpace,
          [],
          {
            #space: space,
            #spaceUser: spaceUser,
            #redirect: redirect,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> updateSpace(_i13.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> removeEmployeeWithSpace() => (super.noSuchMethod(
        Invocation.method(
          #removeEmployeeWithSpace,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> removeAll() => (super.noSuchMethod(
        Invocation.method(
          #removeAll,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  void addListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SpaceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSpaceService extends _i1.Mock implements _i15.SpaceService {
  MockSpaceService() {
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
  String get generateNewSpaceId => (super.noSuchMethod(
        Invocation.getter(#generateNewSpaceId),
        returnValue: '',
      ) as String);
  @override
  _i7.Future<_i13.Space?> getSpace(String? spaceId) => (super.noSuchMethod(
        Invocation.method(
          #getSpace,
          [spaceId],
        ),
        returnValue: _i7.Future<_i13.Space?>.value(),
      ) as _i7.Future<_i13.Space?>);
  @override
  _i7.Future<void> createSpace({required _i13.Space? space}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createSpace,
          [],
          {#space: space},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> updateSpace(_i13.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteSpace({
    required String? spaceId,
    required List<String>? owners,
    required String? uid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteSpace,
          [],
          {
            #spaceId: spaceId,
            #owners: owners,
            #uid: uid,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<List<_i13.Space>> getSpacesOfUser(String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSpacesOfUser,
          [uid],
        ),
        returnValue: _i7.Future<List<_i13.Space>>.value(<_i13.Space>[]),
      ) as _i7.Future<List<_i13.Space>>);
  @override
  _i7.Future<int> getPaidLeaves({required String? spaceId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPaidLeaves,
          [],
          {#spaceId: spaceId},
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<void> updateLeaveCount({
    required String? spaceId,
    required int? paidLeaveCount,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLeaveCount,
          [],
          {
            #spaceId: spaceId,
            #paidLeaveCount: paidLeaveCount,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}
