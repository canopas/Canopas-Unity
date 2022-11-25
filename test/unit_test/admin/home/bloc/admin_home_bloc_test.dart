import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:projectunity/core/extensions/date_time.dart';
import 'package:projectunity/exception/error_const.dart';
import 'package:projectunity/model/employee/employee.dart';
import 'package:projectunity/model/leave/leave.dart';
import 'package:projectunity/model/leave_application.dart';
import 'package:projectunity/model/leave_count.dart';
import 'package:projectunity/navigation/nav_stack/nav_stack_item.dart';
import 'package:projectunity/navigation/navigation_stack_manager.dart';
import 'package:projectunity/services/admin/employee/employee_service.dart';
import 'package:projectunity/services/admin/paid_leave/paid_leave_service.dart';
import 'package:projectunity/services/admin/requests/admin_leave_service.dart';
import 'package:projectunity/services/leave/user_leave_service.dart';
import 'package:projectunity/ui/admin/home/bloc/admin_home_bloc.dart';
import 'package:projectunity/ui/admin/home/bloc/admin_home_event.dart';
import 'package:projectunity/ui/admin/home/bloc/admin_home_state.dart';

import 'admin_home_bloc_test.mocks.dart';

@GenerateMocks([EmployeeService,AdminLeaveService,PaidLeaveService,UserLeaveService,NavigationStackManager])
void main() {
    TestWidgetsFlutterBinding.ensureInitialized();
  late EmployeeService employeeService;
  late AdminLeaveService adminLeaveService;
  late PaidLeaveService paidLeaveService;
  late UserLeaveService userLeaveService;
  late AdminHomeBloc adminHomeBloc;
  late NavigationStackManager navigationStackManager;

  Employee employee = Employee(
      id: 'id',
      roleType: 1,
      name: 'Andrew jhone',
      employeeId: '100',
      email: 'andrew.j@canopas.com',
      designation: 'Android developer');

  Leave leave = Leave(
      leaveId: 'leave-id',
      uid: 'id',
      leaveType: 2,
      startDate: 500,
      endDate: 600,
      totalLeaves: 2,
      reason: 'reason',
      leaveStatus: 2,
      appliedOn: 400,
      perDayDuration: [0, 1]);
  AdminHomeState initialState = const AdminHomeState(
      status: AdminHomeStatus.initial,
      leaveAppMap: {},
      totalOfEmployees: 0,
      totalAbsence: 0,
      totalOfRequests: 0);

  AdminHomeState loadingState = const AdminHomeState(
      status: AdminHomeStatus.loading,
      totalAbsence: 0,
      leaveAppMap: {},
      totalOfRequests: 0,
      totalOfEmployees: 0);

  setUpAll(() {
    navigationStackManager = MockNavigationStackManager();
    employeeService = MockEmployeeService();
    adminLeaveService = MockAdminLeaveService();
    userLeaveService = MockUserLeaveService();
    paidLeaveService = MockPaidLeaveService();

    adminHomeBloc = AdminHomeBloc(
      navigationStackManager,
      adminLeaveService,
      employeeService,
      userLeaveService,
      paidLeaveService,
    );
  });

  group('AdminHomeScreenBloc', () {
    test('emits initial state after AdminHome screen is open', () {
      expect(adminHomeBloc.state, initialState);
    });
    test('Emits failure state due to any exception', () {
      when(adminLeaveService.getAllAbsence()).thenAnswer((_) async {
        return [leave, leave];
      });
      when(employeeService.getEmployeeStream())
          .thenThrow(Exception(firestoreFetchDataError));

      AdminHomeState loadingStateWithAbsenceCount = const AdminHomeState(
          status: AdminHomeStatus.loading,
          leaveAppMap: {},
          totalOfEmployees: 0,
          totalOfRequests: 0,
          totalAbsence: 2);
      AdminHomeState failureState = const AdminHomeState(
          status: AdminHomeStatus.failure, error: firestoreFetchDataError);

      expectLater(
          adminHomeBloc.stream,
          emitsInOrder(
              [loadingState, loadingStateWithAbsenceCount, failureState]));

      adminHomeBloc.add(AdminHomeInitialLoadEvent());
    });
    test('Emits loading state while fetching data from firestore and then emits Success state with  data', () async {
      List<Employee> employeeList=[employee];
      List<Leave> leaveList=[leave];

      when(userLeaveService.getUserUsedLeaveCount(employee.id))
          .thenAnswer((_) =>  Future(() => 10));
      when(paidLeaveService.getPaidLeaves())
          .thenAnswer((_) => Future(() => 12));
      when(adminLeaveService.getAllAbsence())
          .thenAnswer((_) async => [leave, leave]);
      when(employeeService.getEmployeeStream())
          .thenAnswer((_) => Stream.fromIterable([employeeList]));
      when(adminLeaveService.getLeaveStream())
          .thenAnswer((_) => Stream.fromIterable([leaveList]));

      adminHomeBloc.add(AdminHomeInitialLoadEvent());

      AdminHomeState loadingStateWithAbsenceCount = const AdminHomeState(
          status: AdminHomeStatus.loading,
          leaveAppMap: {},
          totalOfEmployees: 0,
          totalOfRequests: 0,
          totalAbsence: 2);
      LeaveApplication la= LeaveApplication(employee: employee, leave: leave,leaveCounts: LeaveCounts(remainingLeaveCount: 2,paidLeaveCount: 12,usedLeaveCount: 10));
      Map<DateTime,List<LeaveApplication>> map={leave.startDate.toDate.dateOnly:[la]};
      AdminHomeState successState=  AdminHomeState(
          status: AdminHomeStatus.success,
          leaveAppMap: map,
          totalOfEmployees: 1,
          totalOfRequests: 1,
          totalAbsence: 2);
      expectLater(
          adminHomeBloc.stream,
          emitsInOrder([
            loadingState,
            loadingStateWithAbsenceCount,
           successState
          ]));
    });
    test('Add correct Remaining leaves of user to it\'s application ', () {
      LeaveApplication application =
          adminHomeBloc.state.leaveAppMap.values.first.first;
      double usedLeaves = application.leaveCounts!.remainingLeaveCount;
      expect(2, usedLeaves);
    });
    test(
        'Emits state with status as success and list of leave application is empty when leave user id doesn\'t match with any user id',
            () {
          Employee empl = Employee(
              id: 'user id',
              roleType: 2,
              name: 'Andrew jhone',
              employeeId: 'Ca 1254',
              email: 'andrew.j@canopas.com',
              designation: 'Android developer');

          List<Employee> employees = [empl];
          List<Leave> leaves = [leave];
          when(userLeaveService.getUserUsedLeaveCount(employee.id))
              .thenAnswer((_) => Future(() => 10));
          when(paidLeaveService.getPaidLeaves()).thenAnswer((_) => Future(() => 12));
          when(adminLeaveService.getAllAbsence())
              .thenAnswer((_) async => [leave, leave]);
          when(employeeService.getEmployeeStream())
              .thenAnswer((_) => Stream.fromIterable([employees]));
          when(adminLeaveService.getLeaveStream())
              .thenAnswer((_) => Stream.fromIterable([leaves]));

          adminHomeBloc.add(AdminHomeInitialLoadEvent());

          AdminHomeState successState = const AdminHomeState(
              status: AdminHomeStatus.success,
              leaveAppMap: {},
              totalOfEmployees: 1,
              totalOfRequests: 0,
              totalAbsence: 2);

          expectLater(
              adminHomeBloc.stream,emitsThrough(successState));
        });
  });

  group('Navigation event', () {
    test('Navigate to Add Member screen on AdminHomeNavigateToAddMember event',
            () async {
          const state = NavStackItem.addMemberState();
          adminHomeBloc.add(AdminHomeNavigateToAddMember());
          await untilCalled(navigationStackManager.push(state));
          verify(navigationStackManager.push(state)).called(1);
        });
    test('Navigate to Setting screen on AdminHomeNavigateToSetting event',
            () async {
          const state = NavStackItem.adminSettingsState();
          adminHomeBloc.add(AdminHomeNavigateToSetting());
          await untilCalled(navigationStackManager.push(state));
          verify(navigationStackManager.push(state)).called(1);
        });
    test(
        'Navigate to Employee list screen on AdminHomeNavigateToEmployeeList event',
            () async {
          const state = NavStackItem.adminEmployeeListState();
          adminHomeBloc.add(AdminHomeNavigateToEmployeeList());
          await untilCalled(navigationStackManager.push(state));
          verify(navigationStackManager.push(state)).called(1);
        });
    test('Navigate to Absence screen on AdminHomeNavigateToAbsenceList event',
            () async {
          const state = NavStackItem.whoIsOutCalendarState();
          adminHomeBloc.add(AdminHomeNavigateToAbsenceList());
          await untilCalled(navigationStackManager.push(state));
          verify(navigationStackManager.push(state)).called(1);
        });
    test(
        'Navigate to Leave Application Detail screen on AdminHomeNavigateToApplicationDetail event',
            () async {
          LeaveApplication leaveApplication =
          LeaveApplication(employee: employee, leave: leave);
          final state = NavStackItem.leaveDetailState(leaveApplication);
          adminHomeBloc.add(AdminHomeNavigateToApplicationDetail(leaveApplication));
          await untilCalled(navigationStackManager.push(state));
          verify(navigationStackManager.push(state)).called(1);
        });

  });


  tearDownAll(() async {
    navigationStackManager.dispose();
    await adminHomeBloc.close();
  });
}
