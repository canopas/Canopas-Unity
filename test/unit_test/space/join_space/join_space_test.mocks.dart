// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/space/join_space/join_space_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i13;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/account/account.dart' as _i6;
import 'package:projectunity/data/model/employee/employee.dart' as _i4;
import 'package:projectunity/data/model/invitation/invitation.dart' as _i10;
import 'package:projectunity/data/model/space/space.dart' as _i3;
import 'package:projectunity/data/provider/device_info.dart' as _i5;
import 'package:projectunity/data/provider/user_state.dart' as _i12;
import 'package:projectunity/data/services/account_service.dart' as _i14;
import 'package:projectunity/data/services/auth_service.dart' as _i16;
import 'package:projectunity/data/services/employee_service.dart' as _i15;
import 'package:projectunity/data/services/invitation_services.dart' as _i8;
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

class _FakeSpace_1 extends _i1.SmartFake implements _i3.Space {
  _FakeSpace_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEmployee_2 extends _i1.SmartFake implements _i4.Employee {
  _FakeEmployee_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDeviceInfoProvider_3 extends _i1.SmartFake
    implements _i5.DeviceInfoProvider {
  _FakeDeviceInfoProvider_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAccount_4 extends _i1.SmartFake implements _i6.Account {
  _FakeAccount_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseAuth_5 extends _i1.SmartFake implements _i7.FirebaseAuth {
  _FakeFirebaseAuth_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [InvitationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockInvitationService extends _i1.Mock implements _i8.InvitationService {
  MockInvitationService() {
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
  _i9.Future<List<_i10.Invitation>> fetchSpaceInvitationsForUserEmail(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSpaceInvitationsForUserEmail,
          [email],
        ),
        returnValue:
            _i9.Future<List<_i10.Invitation>>.value(<_i10.Invitation>[]),
      ) as _i9.Future<List<_i10.Invitation>>);
  @override
  _i9.Future<bool> checkMemberInvitationAlreadyExist({
    required String? spaceId,
    required String? email,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkMemberInvitationAlreadyExist,
          [],
          {
            #spaceId: spaceId,
            #email: email,
          },
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<List<_i10.Invitation>> fetchSpaceInvitations(
          {required String? spaceId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSpaceInvitations,
          [],
          {#spaceId: spaceId},
        ),
        returnValue:
            _i9.Future<List<_i10.Invitation>>.value(<_i10.Invitation>[]),
      ) as _i9.Future<List<_i10.Invitation>>);
  @override
  _i9.Future<void> addInvitation({
    required String? senderId,
    required String? spaceId,
    required String? receiverEmail,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addInvitation,
          [],
          {
            #senderId: senderId,
            #spaceId: spaceId,
            #receiverEmail: receiverEmail,
          },
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> deleteInvitation({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteInvitation,
          [],
          {#id: id},
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
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
  _i9.Future<_i3.Space?> getSpace(String? spaceId) => (super.noSuchMethod(
        Invocation.method(
          #getSpace,
          [spaceId],
        ),
        returnValue: _i9.Future<_i3.Space?>.value(),
      ) as _i9.Future<_i3.Space?>);
  @override
  _i9.Future<_i3.Space> createSpace({
    String? logo,
    required String? name,
    String? domain,
    required int? timeOff,
    required String? ownerId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createSpace,
          [],
          {
            #logo: logo,
            #name: name,
            #domain: domain,
            #timeOff: timeOff,
            #ownerId: ownerId,
          },
        ),
        returnValue: _i9.Future<_i3.Space>.value(_FakeSpace_1(
          this,
          Invocation.method(
            #createSpace,
            [],
            {
              #logo: logo,
              #name: name,
              #domain: domain,
              #timeOff: timeOff,
              #ownerId: ownerId,
            },
          ),
        )),
      ) as _i9.Future<_i3.Space>);
  @override
  _i9.Future<void> updateSpace(_i3.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> deleteSpace({
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<List<_i3.Space>> getSpacesOfUser(String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSpacesOfUser,
          [uid],
        ),
        returnValue: _i9.Future<List<_i3.Space>>.value(<_i3.Space>[]),
      ) as _i9.Future<List<_i3.Space>>);
  @override
  _i9.Future<int> getPaidLeaves({required String? spaceId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPaidLeaves,
          [],
          {#spaceId: spaceId},
        ),
        returnValue: _i9.Future<int>.value(0),
      ) as _i9.Future<int>);
  @override
  _i9.Future<void> updateLeaveCount({
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
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
  _i4.Employee get employee => (super.noSuchMethod(
        Invocation.getter(#employee),
        returnValue: _FakeEmployee_2(
          this,
          Invocation.getter(#employee),
        ),
      ) as _i4.Employee);
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
  _i9.Future<void> setUser(_i6.Account? user) => (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> setEmployeeWithSpace({
    required _i3.Space? space,
    required _i4.Employee? spaceUser,
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> updateSpace(_i3.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> removeEmployeeWithSpace() => (super.noSuchMethod(
        Invocation.method(
          #removeEmployeeWithSpace,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> removeAll() => (super.noSuchMethod(
        Invocation.method(
          #removeAll,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  void addListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i13.VoidCallback? listener) => super.noSuchMethod(
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

/// A class which mocks [AccountService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountService extends _i1.Mock implements _i14.AccountService {
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
  _i5.DeviceInfoProvider get deviceInfoProvider => (super.noSuchMethod(
        Invocation.getter(#deviceInfoProvider),
        returnValue: _FakeDeviceInfoProvider_3(
          this,
          Invocation.getter(#deviceInfoProvider),
        ),
      ) as _i5.DeviceInfoProvider);
  @override
  _i9.Future<_i6.Account> getUser(_i7.User? authData) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [authData],
        ),
        returnValue: _i9.Future<_i6.Account>.value(_FakeAccount_4(
          this,
          Invocation.method(
            #getUser,
            [authData],
          ),
        )),
      ) as _i9.Future<_i6.Account>);
  @override
  _i9.Future<void> updateSpaceOfUser({
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> deleteSpaceIdFromAccount({
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<List<String>> fetchSpaceIds({required String? uid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSpaceIds,
          [],
          {#uid: uid},
        ),
        returnValue: _i9.Future<List<String>>.value(<String>[]),
      ) as _i9.Future<List<String>>);
}

/// A class which mocks [EmployeeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmployeeService extends _i1.Mock implements _i15.EmployeeService {
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
  _i9.Stream<List<_i4.Employee>> employees(String? spaceId) =>
      (super.noSuchMethod(
        Invocation.method(
          #employees,
          [spaceId],
        ),
        returnValue: _i9.Stream<List<_i4.Employee>>.empty(),
      ) as _i9.Stream<List<_i4.Employee>>);
  @override
  _i9.Future<void> addEmployeeBySpaceId({
    required _i4.Employee? employee,
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<_i4.Employee?> getEmployeeBySpaceId({
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
        returnValue: _i9.Future<_i4.Employee?>.value(),
      ) as _i9.Future<_i4.Employee?>);
  @override
  _i9.Future<List<_i4.Employee>> getEmployees() => (super.noSuchMethod(
        Invocation.method(
          #getEmployees,
          [],
        ),
        returnValue: _i9.Future<List<_i4.Employee>>.value(<_i4.Employee>[]),
      ) as _i9.Future<List<_i4.Employee>>);
  @override
  _i9.Future<_i4.Employee?> getEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getEmployee,
          [id],
        ),
        returnValue: _i9.Future<_i4.Employee?>.value(),
      ) as _i9.Future<_i4.Employee?>);
  @override
  _i9.Future<bool> hasUser(String? email) => (super.noSuchMethod(
        Invocation.method(
          #hasUser,
          [email],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<void> addEmployee(_i4.Employee? employee) => (super.noSuchMethod(
        Invocation.method(
          #addEmployee,
          [employee],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> updateEmployeeDetails({required _i4.Employee? employee}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateEmployeeDetails,
          [],
          {#employee: employee},
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> changeEmployeeRoleType(
    String? id,
    _i4.Role? role,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeEmployeeRoleType,
          [
            id,
            role,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> deleteEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteEmployee,
          [id],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> changeAccountStatus({
    required String? id,
    required _i4.EmployeeStatus? status,
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
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i16.AuthService {
  MockAuthService() {
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
  _i7.FirebaseAuth get firebaseAuth => (super.noSuchMethod(
        Invocation.getter(#firebaseAuth),
        returnValue: _FakeFirebaseAuth_5(
          this,
          Invocation.getter(#firebaseAuth),
        ),
      ) as _i7.FirebaseAuth);
  @override
  _i9.Future<_i7.User?> signInWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #signInWithGoogle,
          [],
        ),
        returnValue: _i9.Future<_i7.User?>.value(),
      ) as _i9.Future<_i7.User?>);
  @override
  _i9.Future<bool> signOutWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #signOutWithGoogle,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}
