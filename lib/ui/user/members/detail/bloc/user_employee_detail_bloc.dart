import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:projectunity/ui/user/members/detail/bloc/user_employee_detail_event.dart';
import 'package:projectunity/ui/user/members/detail/bloc/user_employee_detail_state.dart';
import '../../../../../data/core/exception/error_const.dart';
import '../../../../../data/services/leave_service.dart';

@Injectable()
class UserEmployeeDetailBloc
    extends Bloc<UserEmployeeDetailEvent, UserEmployeeDetailState> {
  final LeaveService _leaveService;

  UserEmployeeDetailBloc(this._leaveService)
      : super(UserEmployeeDetailInitialState()) {
    on<UserEmployeeDetailFetchEvent>(_fetchInitialData);
  }

  Future<void> _fetchInitialData(UserEmployeeDetailFetchEvent event,
      Emitter<UserEmployeeDetailState> emit) async {
    emit(UserEmployeeDetailLoadingState());
    try {
      final leaves = await _leaveService.getUpcomingLeavesOfUser(event.uid);
        emit(UserEmployeeDetailSuccessState(upcomingLeaves: leaves));
    } on Exception {
      emit(UserEmployeeDetailErrorState(error: firestoreFetchDataError));
    }
  }
}
