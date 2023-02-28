import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:projectunity/core/extensions/date_time.dart';
import 'package:projectunity/exception/error_const.dart';
import 'package:projectunity/model/employee/employee.dart';
import 'package:projectunity/model/leave/leave.dart';
import 'package:projectunity/services/admin/employee_service.dart';
import 'package:projectunity/services/user/user_leave_service.dart';
import 'package:projectunity/ui/user/employees/detail/bloc/user_employee_detail_bloc.dart';
import 'package:projectunity/ui/user/employees/detail/bloc/user_employee_detail_event.dart';
import 'package:projectunity/ui/user/employees/detail/bloc/user_employee_detail_state.dart';

import '../../../admin/home/home_screen/bloc/admin_home_bloc_test.mocks.dart';

@GenerateMocks([EmployeeService, UserLeaveService, UserEmployeeDetailBloc])
void main() {
  late EmployeeService employeeService;
  late UserLeaveService userLeaveService;
  late UserEmployeeDetailBloc bloc;

  Employee employee = const Employee(
      id: 'uid',
      roleType: 1,
      name: 'Andrew jhone',
      employeeId: 'employeeId',
      email: 'andrew.j@canopas.com',
      designation: 'Android develeoper');

  Leave upcomingApproveLeave = Leave(
      leaveId: 'leaveId',
      uid: 'uid',
      leaveType: 2,
      startDate: DateTime.now().add(const Duration(days: 2)).timeStampToInt,
      endDate: DateTime.now().add(const Duration(days: 1)).timeStampToInt,
      totalLeaves: 2,
      reason: 'Suffering from viral fever',
      leaveStatus: approveLeaveStatus,
      appliedOn: 1,
      perDayDuration: const [1, 1]);

  setUp(() {
    employeeService = MockEmployeeService();
    userLeaveService = MockUserLeaveService();
    bloc = UserEmployeeDetailBloc(employeeService, userLeaveService);
  });

  group('bloc state stream', () {
    test('emits UserEmployeeDetail Initial state as state of bloc', () {
      expect(bloc.state, UserEmployeeDetailInitialState());
    });

    test(
        'Emits loading state and success state after data is fetched successfully from firestore',
        () {
      when(employeeService.getEmployee(employee.id))
          .thenAnswer((_) async => employee);
      when(userLeaveService.getUpcomingLeaves(employee.id))
          .thenAnswer((_) async => [upcomingApproveLeave]);
      expectLater(
          bloc.stream,
          emitsInOrder([
            UserEmployeeDetailLoadingState(),
            UserEmployeeDetailSuccessState(
                employee: employee, upcomingLeaves: [upcomingApproveLeave])
          ]));
      bloc.add(UserEmployeeDetailFetchEvent(employeeId: employee.id));
    });
    test(
        'Emits loading state and error state if employee is found null from firestore',
        () {
      when(employeeService.getEmployee(employee.id))
          .thenAnswer((_) async => null);
      when(userLeaveService.getUpcomingLeaves(employee.id))
          .thenAnswer((_) async => [upcomingApproveLeave]);
      expectLater(
          bloc.stream,
          emitsInOrder([
            UserEmployeeDetailLoadingState(),
            UserEmployeeDetailErrorState(error: firestoreFetchDataError)
          ]));
      bloc.add(UserEmployeeDetailFetchEvent(employeeId: employee.id));
    });
    test(
        'Emits loading state and error state if exception is thrown from firestore',
        () {
      when(employeeService.getEmployee(employee.id))
          .thenAnswer((_) async => null);
      when(userLeaveService.getUpcomingLeaves(employee.id))
          .thenThrow(Exception(firestoreFetchDataError));
      expectLater(
          bloc.stream,
          emitsInOrder([
            UserEmployeeDetailLoadingState(),
            UserEmployeeDetailErrorState(error: firestoreFetchDataError)
          ]));
      bloc.add(UserEmployeeDetailFetchEvent(employeeId: employee.id));
    });
  });
}
