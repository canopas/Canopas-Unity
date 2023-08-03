import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/data/provider/user_state.dart';
import 'package:projectunity/data/services/account_service.dart';
import 'package:projectunity/data/services/space_service.dart';
import '../../../../../data/repo/employee_repo.dart';
import '../../../../../data/core/exception/error_const.dart';
import '../../../../../data/model/employee/employee.dart';
import '../../../../../data/services/employee_service.dart';
import '../../../../../data/services/leave_service.dart';
import 'employee_detail_event.dart';
import 'employee_detail_state.dart';

@Injectable()
class EmployeeDetailBloc
    extends Bloc<EmployeeDetailEvent, AdminEmployeeDetailState> {
  final LeaveService _leaveService;
  final EmployeeService _employeeService;
  final EmployeeRepo _employeeRepo;
  final UserStateNotifier _userManager;
  final AccountService _accountService;
  final SpaceService _spaceService;

  EmployeeDetailBloc(
      this._accountService,
      this._spaceService,
      this._userManager,
      this._employeeService,
      this._leaveService,
      this._employeeRepo)
      : super(EmployeeDetailInitialState()) {
    on<EmployeeDetailInitialLoadEvent>(_onInitialLoad);
    on<EmployeeStatusChangeEvent>(_onEmployeeStatusChangeEvent);
  }

  Future<void> _onInitialLoad(EmployeeDetailInitialLoadEvent event,
      Emitter<AdminEmployeeDetailState> emit) async {
    emit(EmployeeDetailLoadingState());
    try {
      final double usedLeaves =
          await _leaveService.getUserUsedLeaves(event.employeeId);
      final int totalLeaves = await _spaceService.getPaidLeaves(
          spaceId: _userManager.currentSpaceId!);
      double percentage = 0.0;
      if (totalLeaves != 0) {
        percentage = usedLeaves / totalLeaves;
      }

      return emit.forEach(
        _employeeRepo.memberDetails(event.employeeId),
        onData: (Employee? employee) {
          if (employee != null) {
            return EmployeeDetailLoadedState(
                employee: employee,
                timeOffRatio: percentage,
                usedLeaves: usedLeaves);
          } else {
            return EmployeeDetailFailureState(error: firestoreFetchDataError);
          }
        },
        onError: (error, stackTrace) =>
            EmployeeDetailFailureState(error: firestoreFetchDataError),
      );
    } on Exception {
      emit(EmployeeDetailFailureState(error: firestoreFetchDataError));
    }
  }

  Future<void> _onEmployeeStatusChangeEvent(EmployeeStatusChangeEvent event,
      Emitter<AdminEmployeeDetailState> emit) async {
    try {
      await _employeeService.changeAccountStatus(
          id: event.employeeId, status: event.status);
      if (event.status == EmployeeStatus.inactive) {
        await _accountService.deleteSpaceIdFromAccount(
            spaceId: _userManager.currentSpaceId!, uid: event.employeeId);
      } else if (event.status == EmployeeStatus.active) {
        await _accountService.addSpaceIdFromAccount(
            spaceId: _userManager.currentSpaceId!, uid: event.employeeId);
      }
    } on Exception {
      emit(EmployeeDetailFailureState(error: firestoreFetchDataError));
    }
  }
}
