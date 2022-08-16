import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:projectunity/configs/font_size.dart';
import 'package:projectunity/di/service_locator.dart';
import 'package:projectunity/navigation/navigation_stack_manager.dart';
import 'package:projectunity/ui/user/home/widget/leave_navigation_card.dart';
import 'package:projectunity/ui/user/home/widget/leave_status.dart';

import '../../../configs/colors.dart';
import '../../../core/utils/const/other_constant.dart';
import '../../../navigation/navigationStackItem/employee/employee_navigation_stack_item.dart';
import '../../../provider/user_data.dart';
import '../../../widget/expanded_app_bar.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  final _stateManager = getIt<NavigationStackManager>();
  final _userManager = getIt<UserManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ExpandedAppBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: AppColors.whiteColor,
                        )),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _stateManager.push(
                                  const EmployeeNavigationStackItem
                                      .settingsState());
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: AppColors.whiteColor,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 80,
                        left: primaryHorizontalSpacing,
                        right: primaryHorizontalSpacing),
                    child: Column(
                      children: [
                        LeaveNavigationCard(
                            color: AppColors.primaryPink,
                            leaveText: AppLocalizations.of(context)
                                .user_home_all_leaves_tag,
                            onPress: () => _stateManager.push(
                                const EmployeeNavigationStackItem
                                    .userAllLeaveState())),
                        LeaveNavigationCard(
                            color: AppColors.primaryBlue,
                            leaveText: AppLocalizations.of(context)
                                .user_home_requested_leaves_tag,
                            onPress: () => _stateManager.push(
                                const EmployeeNavigationStackItem
                                    .requestedLeaves())),
                        LeaveNavigationCard(
                            color: AppColors.primaryGreen,
                            leaveText: AppLocalizations.of(context)
                                .user_home_upcoming_leaves_tag,
                            onPress: () => _stateManager.push(
                                const EmployeeNavigationStackItem
                                    .userUpcomingLeaveState())),
                        LeaveNavigationCard(
                            color: AppColors.primaryDarkYellow,
                            leaveText: AppLocalizations.of(context)
                                .user_home_apply_leave_tag,
                            onPress: () {
                              _stateManager.setBottomBar(false);
                              _stateManager.push(
                                  const EmployeeNavigationStackItem
                                      .leaveRequestState());
                            }),
                        /* _buildTitle(onPress: () {}),
                        const TeamLeaveCard(
                          length: 10,
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
              top: topSpacing, right: 10, left: 10, child: LeaveStatus())
        ],
      ),
    );
  }

  Widget _buildTitle({required Function() onPress}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            AppLocalizations.of(context).user_home_who_onLeave_tag,
            style: const TextStyle(
              fontSize: titleTextSize,
              color: AppColors.secondaryText,
            ),
          ),
          TextButton(
              onPressed: onPress,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Text(
                  AppLocalizations.of(context).user_home_button_view_all,
                  style: const TextStyle(
                    color: AppColors.blueGrey,
                    fontSize: smallTextSize,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}