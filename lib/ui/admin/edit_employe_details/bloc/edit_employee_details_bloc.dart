import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/core/extensions/date_time.dart';
import 'package:projectunity/exception/error_const.dart';
import 'package:projectunity/ui/admin/edit_employe_details/bloc/edit_employee_details_events.dart';
import 'package:projectunity/ui/admin/edit_employe_details/bloc/edit_employee_details_state.dart';
import '../../../../services/admin/employee/employee_service.dart';

@Injectable()
class AdminEditEmployeeDetailsBloc extends Bloc<AdminEditEmployeeDetailsEvents,
    AdminEditEmployeeDetailsState> {
  final EmployeeService _employeeService;

  AdminEditEmployeeDetailsBloc(this._employeeService)
      : super(const AdminEditEmployeeDetailsState()) {
    on<AdminEditEmployeeDetailsInitialEvent>(_initRoleTypeAndDate);
    on<ChangeRoleTypeAdminEditEmployeeDetailsEvents>(_changeRoleType);
    on<UpdateEmployeeDetailsAdminEditEmployeeDetailsEvents>(_updateEmployee);
    on<ChangeDateOfJoiningAdminEditEmployeeDetailsEvents>(_changeDateOfJoining);
    on<ValidDesignationAdminEditEmployeeDetailsEvents>(_validDesignation);
    on<ValidEmailAdminEditEmployeeDetailsEvents>(_validEmail);
    on<ValidEmployeeIdAdminEditEmployeeDetailsEvents>(_validEmployeeId);
    on<ValidNameAdminEditEmployeeDetailsEvents>(_validName);
  }

  _initRoleTypeAndDate(AdminEditEmployeeDetailsInitialEvent event, Emitter<AdminEditEmployeeDetailsState> emit){
    emit(state.copyWith(roleType: event.roleType,dateOfJoining: event.joiningDate?.toDate ?? DateTime.now().dateOnly));
  }

  _changeRoleType(ChangeRoleTypeAdminEditEmployeeDetailsEvents event,
      Emitter<AdminEditEmployeeDetailsState> emit) {
    emit(state.copyWith(roleType: event.roleType));
  }

  _changeDateOfJoining(ChangeDateOfJoiningAdminEditEmployeeDetailsEvents event,
      Emitter<AdminEditEmployeeDetailsState> emit) {
    emit(state.copyWith(dateOfJoining: event.dateOfJoining));
  }

  _validName(ValidNameAdminEditEmployeeDetailsEvents event, Emitter<AdminEditEmployeeDetailsState> emit) {
    if(event.name.length < 4){
      emit(state.copyWith(nameError: true));
    } else {
      emit(state.copyWith(nameError: false));
    }
  }
  _validEmail(ValidEmailAdminEditEmployeeDetailsEvents event, Emitter<AdminEditEmployeeDetailsState> emit) {
    if(event.email.isEmpty || !event.email.contains('@')){
      emit(state.copyWith(emailError: true));
    } else {
      emit(state.copyWith(emailError: false));
    }
  }
  _validDesignation(ValidDesignationAdminEditEmployeeDetailsEvents event, Emitter<AdminEditEmployeeDetailsState> emit) {
    if(event.designation.isEmpty){
      emit(state.copyWith(designationError: true));
    } else {
      emit(state.copyWith(designationError: false));
    }
  }


  _validEmployeeId(ValidEmployeeIdAdminEditEmployeeDetailsEvents event, Emitter<AdminEditEmployeeDetailsState> emit) {
    if(event.employeeId.isEmpty){
      emit(state.copyWith(employeeIdError: true));
    } else {
      emit(state.copyWith(employeeIdError: false));
    }
  }

  _updateEmployee(UpdateEmployeeDetailsAdminEditEmployeeDetailsEvents event, Emitter<AdminEditEmployeeDetailsState> emit) async {
    emit(state.copyWith(adminEditEmployeeDetailsStatus: AdminEditEmployeeDetailsStatus.loading));
    Future.delayed(Duration(seconds: 10));
      if(event.name.length < 4 || event.email.isEmpty || !event.email.contains('@') || event.designation.isEmpty || event.employeeId.isEmpty){
        emit(state.copyWith(adminEditEmployeeDetailsStatus: AdminEditEmployeeDetailsStatus.failure,error: fillDetailsError));
      }else {
        try {
          await _employeeService.adminUpdateEmployeeDetails(
            id: event.id,
            name: event.name,
            employeeId: event.employeeId,
            email: event.email,
            level: event.level.isEmpty?null:event.level,
            designation: event.designation,
            roleType: state.roleType,
            dateOfJoining: state.dateOfJoining!.timeStampToInt,
          );
          emit(state.copyWith(adminEditEmployeeDetailsStatus: AdminEditEmployeeDetailsStatus.success));
        } on Exception {
          emit(state.copyWith(adminEditEmployeeDetailsStatus: AdminEditEmployeeDetailsStatus.failure, error: firestoreFetchDataError));
        }
      }
  }
}
