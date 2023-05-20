import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/ui/user/members/members_screen/bloc/user_members_event.dart';
import 'package:projectunity/ui/user/members/members_screen/bloc/user_members_state.dart';
import '../../../../../data/core/exception/error_const.dart';
import '../../../../../data/services/employee_service.dart';

@Injectable()
class UserEmployeesBloc extends Bloc<UserEmployeesEvent, UserEmployeesState> {
  final EmployeeService employeeService;

  UserEmployeesBloc(this.employeeService)
      : super(UserEmployeesInitialState()) {
    on<FetchEmployeesEvent>(_fetchEmployee);
  }

  Future<void> _fetchEmployee(
      FetchEmployeesEvent event, Emitter<UserEmployeesState> emit) async {
    emit(UserEmployeesLoadingState());
    try {
      final employees = await employeeService.getEmployees();
      emit(UserEmployeesSuccessState(employees: employees));
    } on Exception {
      emit(UserEmployeesFailureState(error: firestoreFetchDataError));
    }
  }
}
