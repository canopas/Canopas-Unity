import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:projectunity/configs/text_style.dart';
import 'package:projectunity/di/service_locator.dart';
import 'package:projectunity/navigation/navigationStackItem/admin/admin_navigation_stack_items.dart';
import 'package:projectunity/navigation/navigation_stack_manager.dart';
import 'package:projectunity/ui/admin/home/widget/employee_list_view.dart';
import 'package:projectunity/ui/admin/home/widget/employee_summary_card.dart';
import 'package:projectunity/widget/expanded_app_bar.dart';
import '../../../bloc/admin/employees_summary/employees_summary_bloc.dart';
import '../../../configs/colors.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final _stateManager = getIt<NavigationStackManager>();
  final _employeeSummary = getIt<EmployeesSummaryBloc>();
  @override
  void initState() {
    _employeeSummary.fetchEmployeeSummary();
    super.initState();
  }

  @override
  void dispose() {
    _employeeSummary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandedAppBar(
                content: Row(children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.whiteColor,
                  )),
              const Spacer(),
              IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    _stateManager.setBottomBar(false);
                    _stateManager
                        .push(const AdminNavigationStackItem.addMemberState());
                  }),
              IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    _stateManager
                        .push(const AdminNavigationStackItem.adminSettingsState());
                  }),
            ])),
            _buildYourEmployeeHeader(),
            const EmployeeListView(),
          ],
        ),
        Positioned(top: 100, right: 10, left: 10, child:
            StreamBuilder(
              stream: _employeeSummary.employeeSummary.stream,
              builder: (context,AsyncSnapshot snapshot) => EmployeeSummaryCard(employeesSummary: _employeeSummary.employeeSummary.value),
            )

        ),
      ],
    ));
  }

  Widget _buildYourEmployeeHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 80),
      child: Text(AppLocalizations.of(context).admin_home_your_employee_tag,
          style: AppTextStyle.settingSubTitle),
    );
  }
}
