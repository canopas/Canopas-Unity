// Mocks generated by Mockito 5.4.0 from annotations
// in projectunity/test/unit_test/admin/member/edit_employee/admin_edit_employee_details_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i11;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:firebase_storage/firebase_storage.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:projectunity/data/model/account/account.dart' as _i9;
import 'package:projectunity/data/model/employee/employee.dart' as _i4;
import 'package:projectunity/data/model/space/space.dart' as _i10;
import 'package:projectunity/data/provider/user_state.dart' as _i8;
import 'package:projectunity/data/services/employee_service.dart' as _i5;
import 'package:projectunity/data/services/storage_service.dart' as _i7;

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

class _FakeFirebaseStorage_1 extends _i1.SmartFake
    implements _i3.FirebaseStorage {
  _FakeFirebaseStorage_1(
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

/// A class which mocks [EmployeeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmployeeService extends _i1.Mock implements _i5.EmployeeService {
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
  _i6.Future<void> addEmployeeBySpaceId({
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
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i4.Employee?> getEmployeeBySpaceId({
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
        returnValue: _i6.Future<_i4.Employee?>.value(),
      ) as _i6.Future<_i4.Employee?>);
  @override
  _i6.Future<List<_i4.Employee>> getEmployees() => (super.noSuchMethod(
        Invocation.method(
          #getEmployees,
          [],
        ),
        returnValue: _i6.Future<List<_i4.Employee>>.value(<_i4.Employee>[]),
      ) as _i6.Future<List<_i4.Employee>>);
  @override
  _i6.Future<_i4.Employee?> getEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getEmployee,
          [id],
        ),
        returnValue: _i6.Future<_i4.Employee?>.value(),
      ) as _i6.Future<_i4.Employee?>);
  @override
  _i6.Future<bool> hasUser(String? email) => (super.noSuchMethod(
        Invocation.method(
          #hasUser,
          [email],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> addEmployee(_i4.Employee? employee) => (super.noSuchMethod(
        Invocation.method(
          #addEmployee,
          [employee],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> updateEmployeeDetails({required _i4.Employee? employee}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateEmployeeDetails,
          [],
          {#employee: employee},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> changeEmployeeRoleType(
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
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> deleteEmployee(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteEmployee,
          [id],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> changeAccountStatus({
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
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [StorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockStorageService extends _i1.Mock implements _i7.StorageService {
  MockStorageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FirebaseStorage get firebaseStorage => (super.noSuchMethod(
        Invocation.getter(#firebaseStorage),
        returnValue: _FakeFirebaseStorage_1(
          this,
          Invocation.getter(#firebaseStorage),
        ),
      ) as _i3.FirebaseStorage);
  @override
  _i6.Future<String> uploadProfilePic({
    required String? path,
    required String? imagePath,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadProfilePic,
          [],
          {
            #path: path,
            #imagePath: imagePath,
          },
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> deleteProfileImage(String? path) => (super.noSuchMethod(
        Invocation.method(
          #deleteProfileImage,
          [path],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [UserStateNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserStateNotifier extends _i1.Mock implements _i8.UserStateNotifier {
  MockUserStateNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.UserState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i8.UserState.unknown,
      ) as _i8.UserState);
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
  _i6.Future<void> setUser(_i9.Account? user) => (super.noSuchMethod(
        Invocation.method(
          #setUser,
          [user],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setEmployeeWithSpace({
    required _i10.Space? space,
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
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> updateSpace(_i10.Space? space) => (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> removeEmployeeWithSpace() => (super.noSuchMethod(
        Invocation.method(
          #removeEmployeeWithSpace,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> removeAll() => (super.noSuchMethod(
        Invocation.method(
          #removeAll,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
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
