import 'package:injectable/injectable.dart';
import 'package:projectunity/model/employee/employee.dart';
import 'package:projectunity/pref/user_preference.dart';

import '../core/utils/const/role.dart';

@Singleton()
class UserManager {
  final UserPreference _userPreference;
  late final Employee? _employee;

  UserManager(this._userPreference)
      : _employee = _userPreference.getCurrentUser();

  String? getUserName() {
    String? fullName = _employee?.name;
    List<String>? words = fullName?.split(" ");
    String name = words![0];

    return fullName;
  }

  String? get userImage => _employee?.imageUrl;

  String get employeeId => _employee!.id;

  bool get isUserLoggedIn => _employee != null;

  bool get isOnBoardCompleted => _userPreference.getOnBoardCompleted() != null;

  bool get isAdmin => _employee?.roleType == kRoleTypeAdmin;
}