import 'package:injectable/injectable.dart';
import 'package:projectunity/model/leave_application.dart';
import 'package:projectunity/rest/api_response.dart';
import 'package:projectunity/services/employee/employee_service.dart';
import 'package:projectunity/services/leave/admin_leave_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../model/employee/employee.dart';
import '../../../model/leave/leave.dart';
import '../../../model/leave_application.dart';

@Singleton()
class LeaveApplicationBloc {
  final EmployeeService _employeeService;
  final AdminLeaveService _adminLeaveService;

  LeaveApplicationBloc(this._employeeService, this._adminLeaveService);

  final BehaviorSubject<List<Leave>> _leaves = BehaviorSubject<List<Leave>>();
  final BehaviorSubject<List<Employee>> _employee =
      BehaviorSubject<List<Employee>>();

  BehaviorSubject<List<Leave>> get leaves => _leaves;

  BehaviorSubject<List<Employee>> get employee => _employee;
  final BehaviorSubject<ApiResponse<List<LeaveApplication>>> _leaveApplication =
      BehaviorSubject<ApiResponse<List<LeaveApplication>>>();

  Stream<ApiResponse<List<LeaveApplication>>> get leaveApplication =>
      _leaveApplication.stream;

  getEmployee() async {
    List<Employee> employees = await _employeeService.getEmployees();
    _employee.add(employees);
  }

  getLeaves() async {
    List<Leave> leaves = await _adminLeaveService.getAllRequests();
    _leaves.add(leaves);
  }

  getLeaveApplication() {
    _leaveApplication.add(const ApiResponse.loading());
    try {
      getLeaves();
      getEmployee();
      Rx.combineLatest2(
        leaves.stream,
        employee.stream,
        (List<Leave> leavesList, List<Employee> employees) =>
            leavesList.map((leave) {
          final employee = employees.firstWhere((emp) => emp.id == leave.uid);
          return LeaveApplication(employee: employee, leave: leave);
        }).toList(),
      ).listen(
        (event) {
          _leaveApplication.add(ApiResponse.completed(data: event));
        },
      );
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}