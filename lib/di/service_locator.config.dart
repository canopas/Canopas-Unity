// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../bloc/admin/admin_home_screen_bloc/admin_home_screen_bloc.dart'
    as _i16;
import '../bloc/admin/employee/employee_detail_bloc.dart' as _i19;
import '../bloc/admin/employee/employee_list_bloc.dart' as _i20;
import '../bloc/admin/employee/employee_validation.dart' as _i7;
import '../bloc/admin/leave/absence_bloc.dart' as _i15;
import '../bloc/admin/leave_count/all_leave_count.dart' as _i3;
import '../bloc/admin/leave_details_screen/admin_leave_details_bloc.dart'
    as _i17;
import '../bloc/authentication/login_bloc.dart' as _i21;
import '../bloc/authentication/logout_bloc.dart' as _i27;
import '../bloc/employee/employee_leave_count/employee_home_bloc.dart' as _i23;
import '../bloc/network/network_service_bloc.dart' as _i10;
import '../bloc/user/user_leave_bloc.dart' as _i26;
import '../navigation/navigation_stack_manager.dart' as _i25;
import '../pref/user_preference.dart' as _i14;
import '../provider/user_data.dart' as _i22;
import '../services/auth/auth_service.dart' as _i5;
import '../services/employee/employee_service.dart' as _i6;
import '../services/leave/admin_leave_service.dart' as _i4;
import '../services/leave/paid_leave_service.dart' as _i11;
import '../services/leave/user_leave_service.dart' as _i13;
import '../stateManager/admin/leave_status_manager.dart' as _i9;
import '../stateManager/auth/auth_manager.dart' as _i18;
import '../stateManager/login_state_manager.dart' as _i24;
import '../stateManager/user/leave_request_data_manager.dart' as _i8;
import 'AppModule.dart' as _i28; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.AdminLeaveCount>(_i3.AdminLeaveCount());
  gh.factory<_i4.AdminLeaveService>(() => _i4.AdminLeaveService());
  gh.singleton<_i5.AuthService>(_i5.AuthService());
  gh.singleton<_i6.EmployeeService>(_i6.EmployeeService());
  gh.singleton<_i7.EmployeeValidationBloc>(_i7.EmployeeValidationBloc());
  gh.singleton<_i8.LeaveRequestDataManager>(_i8.LeaveRequestDataManager());
  gh.singleton<_i9.LeaveStatusManager>(
      _i9.LeaveStatusManager(get<_i4.AdminLeaveService>()));
  gh.singleton<_i10.NetworkServiceBloc>(_i10.NetworkServiceBloc());
  gh.singleton<_i11.PaidLeaveService>(_i11.PaidLeaveService());
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => appModule.preferences,
    preResolve: true,
  );
  gh.singleton<_i13.UserLeaveService>(_i13.UserLeaveService());
  gh.factory<_i14.UserPreference>(
      () => _i14.UserPreference(get<_i12.SharedPreferences>()));
  gh.singleton<_i15.AbsenceBloc>(_i15.AbsenceBloc(
    get<_i6.EmployeeService>(),
    get<_i4.AdminLeaveService>(),
  ));
  gh.factory<_i16.AdminHomeScreenBloc>(() => _i16.AdminHomeScreenBloc(
        get<_i6.EmployeeService>(),
        get<_i4.AdminLeaveService>(),
        get<_i13.UserLeaveService>(),
        get<_i11.PaidLeaveService>(),
      ));
  gh.singleton<_i17.AdminLeaveDetailsScreenBloc>(
      _i17.AdminLeaveDetailsScreenBloc(
    get<_i13.UserLeaveService>(),
    get<_i11.PaidLeaveService>(),
  ));
  gh.singleton<_i18.AuthManager>(_i18.AuthManager(
    get<_i14.UserPreference>(),
    get<_i5.AuthService>(),
  ));
  gh.singleton<_i19.EmployeeDetailBloc>(
      _i19.EmployeeDetailBloc(get<_i6.EmployeeService>()));
  gh.singleton<_i20.EmployeeListBloc>(
      _i20.EmployeeListBloc(get<_i6.EmployeeService>()));
  gh.singleton<_i21.LoginBloc>(_i21.LoginBloc(get<_i18.AuthManager>()));
  gh.singleton<_i22.UserManager>(_i22.UserManager(get<_i14.UserPreference>()));
  gh.factory<_i23.EmployeeHomeBLoc>(() => _i23.EmployeeHomeBLoc(
        get<_i22.UserManager>(),
        get<_i13.UserLeaveService>(),
        get<_i11.PaidLeaveService>(),
      ));
  gh.singleton<_i24.LoginState>(_i24.LoginState(get<_i22.UserManager>()));
  gh.lazySingleton<_i25.NavigationStackManager>(
    () => _i25.NavigationStackManager(get<_i22.UserManager>()),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i26.UserLeavesBloc>(_i26.UserLeavesBloc(
    get<_i13.UserLeaveService>(),
    get<_i22.UserManager>(),
  ));
  gh.factory<_i27.LogOutBloc>(() => _i27.LogOutBloc(
        get<_i24.LoginState>(),
        get<_i14.UserPreference>(),
      ));
  return get;
}

class _$AppModule extends _i28.AppModule {}
