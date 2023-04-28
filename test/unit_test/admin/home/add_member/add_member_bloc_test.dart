import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:projectunity/data/core/utils/bloc_status.dart';
import 'package:projectunity/data/model/employee/employee.dart';
import 'package:projectunity/data/services/employee_service.dart';
import 'package:projectunity/ui/admin/home/addmember/bloc/add_member_bloc.dart';
import 'package:projectunity/ui/admin/home/addmember/bloc/add_member_event.dart';
import 'package:projectunity/ui/admin/home/addmember/bloc/add_member_state.dart';

import 'add_member_bloc_test.mocks.dart';

@GenerateMocks([EmployeeService])
void main() {
  late AddMemberBloc addMemberBloc;
  late EmployeeService employeeService;
  AddMemberFormState initialState = const AddMemberFormState(
      role: Role.employee,
      employeeId: '',
      name: '',
      email: '',
      designation: '',
      idError: false,
      nameError: false,
      emailError: false,
      designationError: false,
      status: Status.initial);

  setUp(() {
    employeeService = MockEmployeeService();
    addMemberBloc = AddMemberBloc(employeeService);
  });
  group('AddMemberBloc events', () {
    test('Emits all initial state after navigate to Add member screen', () {
      expectLater(addMemberBloc.state, initialState);
    });

    group('Select role type', () {
      test(
          'Emits state with with default employee role when no role is selected by user',
          () {
            addMemberBloc.add(const SelectRoleEvent());
        const stateWithoutRole = AddMemberFormState(role: Role.employee);
        expectLater(addMemberBloc.stream, emits(stateWithoutRole));
      });

      test('Emits state with with selected role on SelectRoleTypeEvent', () {
        addMemberBloc.add(const SelectRoleEvent(role: Role.admin));
        const stateWithSelectedRole = AddMemberFormState(role: Role.admin);
        expect(addMemberBloc.stream, emits(stateWithSelectedRole));
      });
    });
    group('Employee id changed event', () {
      test(
          'Emits state with entered value of employee id on AddEmployeeIdEvent',
          () {
        addMemberBloc.add(const AddEmployeeIdEvent(employeeId: 'Ca 1254'));
        AddMemberFormState stateWithEmployeeId =
            const AddMemberFormState(employeeId: 'Ca 1254', idError: false);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeId));
      });
      test('Emits error when entered employee id value is less than 4', () {
        addMemberBloc.add(const AddEmployeeIdEvent(employeeId: 'Ca'));
        AddMemberFormState stateWithEmployeeId =
            const AddMemberFormState(employeeId: 'Ca', idError: true);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeId));
      });
    });

    group('Employee name changed event', () {
      test(
          'Emits state with entered value of employee name on AddEmployeeNameEvent',
          () {
        addMemberBloc.add(const AddEmployeeNameEvent(name: 'Andrew jhone'));
        AddMemberFormState stateWithEmployeeName =
            const AddMemberFormState(name: 'Andrew jhone', nameError: false);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeName));
      });
      test('Emits error when entered employee name value is less than 4', () {
        addMemberBloc.add(const AddEmployeeNameEvent(name: 'a'));
        AddMemberFormState stateWithEmployeeName =
            const AddMemberFormState(name: 'a', nameError: true);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeName));
      });
    });

    group('Employee email changed event', () {
      test(
          'Emits state with entered value of employee email on AddEmployeeEmailEvent',
          () {
        addMemberBloc
            .add(const AddEmployeeEmailEvent(email: 'Andrew.j@canopas.com'));
        AddMemberFormState stateWithEmployeeEmail = const AddMemberFormState(
            email: 'Andrew.j@canopas.com', emailError: false);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeEmail));
      });
      test('Emits error when entered employee email value is less than 4', () {
        addMemberBloc.add(const AddEmployeeEmailEvent(email: 'a'));
        AddMemberFormState stateWithEmployeeEmail =
            const AddMemberFormState(email: 'a', emailError: true);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeEmail));
      });
      test('Emits error when entered employee email does not contain @', () {
        addMemberBloc
            .add(const AddEmployeeEmailEvent(email: 'andrew.jhone.com'));
        AddMemberFormState stateWithEmployeeEmail = const AddMemberFormState(
            email: 'andrew.jhone.com', emailError: true);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeEmail));
      });
    });

    group('Employee designtaion changed event', () {
      test(
          'Emits state with entered value of employee designation on AddEmployeeDesignationEvent',
          () {
        addMemberBloc
            .add(const AddEmployeeDesignationEvent(designation: 'Android dev'));
        AddMemberFormState stateWithEmployeeDesignation =
            const AddMemberFormState(
                designation: 'Android dev', designationError: false);
        expectLater(addMemberBloc.stream, emits(stateWithEmployeeDesignation));
      });
    });
  });

  group('Add member bloc stream', () {
    setUpAll(() {
      employeeService = MockEmployeeService();
      addMemberBloc = AddMemberBloc(employeeService);
    });

    test('Emits state with with selected role on SelectRoleTypeEvent', () {
      addMemberBloc.add(const SelectRoleEvent(role: Role.admin));
      const stateWithSelectedRole = AddMemberFormState(role: Role.admin);
      expect(addMemberBloc.stream, emitsInOrder([stateWithSelectedRole]));

      addMemberBloc.add(const AddEmployeeNameEvent(name: 'Andrew jhone'));
      AddMemberFormState stateWithEmployeeName = const AddMemberFormState(
          name: 'Andrew jhone', nameError: false, role: Role.admin);
      expectLater(addMemberBloc.stream,
          emitsInOrder([stateWithSelectedRole, stateWithEmployeeName]));

      addMemberBloc
          .add(const AddEmployeeEmailEvent(email: 'Andrew.j@canopas.com'));
      AddMemberFormState stateWithEmployeeEmail = const AddMemberFormState(
          email: 'Andrew.j@canopas.com',
          emailError: false,
          name: 'Andrew jhone',
          nameError: false,
          role: Role.admin);
      expectLater(
          addMemberBloc.stream,
          emitsInOrder([
            stateWithSelectedRole,
            stateWithEmployeeName,
            stateWithEmployeeEmail
          ]));

      addMemberBloc
          .add(const AddEmployeeDesignationEvent(designation: 'Android dev'));
      AddMemberFormState stateWithEmployeeDesignation =
          const AddMemberFormState(
              designation: 'Android dev',
              designationError: false,
              email: 'Andrew.j@canopas.com',
              emailError: false,
              name: 'Andrew jhone',
              nameError: false,
              role: Role.admin);
      expectLater(
          addMemberBloc.stream,
          emitsInOrder([
            stateWithSelectedRole,
            stateWithEmployeeName,
            stateWithEmployeeEmail,
            stateWithEmployeeDesignation
          ]));
    });
  });
}
