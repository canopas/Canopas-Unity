// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/user/leaves/leaves_screen/bloc/leave_count/user_leave_count_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i10;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/account/account.dart' as _i8;
import 'package:projectunity/data/model/employee/employee.dart' as _i3;
import 'package:projectunity/data/model/leave/leave.dart' as _i6;
import 'package:projectunity/data/model/space/space.dart' as _i9;
import 'package:projectunity/data/provider/user_state.dart' as _i7;
import 'package:projectunity/data/services/leave_service.dart' as _i4;
import 'package:projectunity/data/services/space_service.dart' as _i11;

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

class _FakeEmployee_1 extends _i1.SmartFake implements _i3.Employee {
  _FakeEmployee_1(
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
  _i5.Stream<List<_i6.Leave>> get leaves => (super.noSuchMethod(
        Invocation.getter(#leaves),
        returnValue: _i5.Stream<List<_i6.Leave>>.empty(),
      ) as _i5.Stream<List<_i6.Leave>>);
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
  _i5.Future<List<_i6.Leave>> getAllApprovedLeaves() => (super.noSuchMethod(
        Invocation.method(
          #getAllApprovedLeaves,
          [],
        ),
        returnValue: _i5.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i5.Future<List<_i6.Leave>>);
  @override
  _i5.Future<List<_i6.Leave>> getAllAbsence({DateTime? date}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllAbsence,
          [],
          {#date: date},
        ),
        returnValue: _i5.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i5.Future<List<_i6.Leave>>);
  @override
  String getNewLeaveId() => (super.noSuchMethod(
        Invocation.method(
          #getNewLeaveId,
          [],
        ),
        returnValue: '',
      ) as String);
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
  _i5.Future<List<_i6.Leave>> getAllLeavesOfUser(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllLeavesOfUser,
          [id],
        ),
        returnValue: _i5.Future<List<_i6.Leave>>.value(<_i6.Leave>[]),
      ) as _i5.Future<List<_i6.Leave>>);
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

/// A class which mocks [UserStateNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserStateNotifier extends _i1.Mock implements _i7.UserStateNotifier {
  MockUserStateNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.UserState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i7.UserState.authenticated,
      ) as _i7.UserState);
  @override
  String get employeeId => (super.noSuchMethod(
        Invocation.getter(#employeeId),
        returnValue: '',
      ) as String);
  @override
  _i3.Employee get employee => (super.noSuchMethod(
        Invocation.getter(#employee),
        returnValue: _FakeEmployee_1(
          this,
          Invocation.getter(#employee),
        ),
      ) as _i3.Employee);
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
  _i5.Future<void> setUser(_i8.Account? user) => (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setEmployeeWithSpace({
    required _i9.Space? space,
    required _i3.Employee? spaceUser,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setEmployeeWithSpace,
          [],
          {
            #space: space,
            #spaceUser: spaceUser,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setEmployee({required _i3.Employee? member}) =>
      (super.noSuchMethod(
        Invocation.method(
          #setEmployee,
          [],
          {#member: member},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setSpace({required _i9.Space? space}) => (super.noSuchMethod(
        Invocation.method(
          #setSpace,
          [],
          {#space: space},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> updateSpace(_i9.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> removeEmployeeWithSpace() => (super.noSuchMethod(
        Invocation.method(
          #removeEmployeeWithSpace,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> removeAll() => (super.noSuchMethod(
        Invocation.method(
          #removeAll,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
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
class MockSpaceService extends _i1.Mock implements _i11.SpaceService {
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
  _i5.Future<_i9.Space?> getSpace(String? spaceId) => (super.noSuchMethod(
        Invocation.method(
          #getSpace,
          [spaceId],
        ),
        returnValue: _i5.Future<_i9.Space?>.value(),
      ) as _i5.Future<_i9.Space?>);
  @override
  _i5.Future<void> createSpace({required _i9.Space? space}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createSpace,
          [],
          {#space: space},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> updateSpace(_i9.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> deleteSpace({
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<int> getPaidLeaves({required String? spaceId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPaidLeaves,
          [],
          {#spaceId: spaceId},
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
}
