import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:projectunity/configs/colors.dart';
import 'package:projectunity/di/service_locator.dart';
import 'package:projectunity/ui/admin/leaves/leave_screen/widget/expandable_list.dart';
import 'package:projectunity/widget/circular_progress_indicator.dart';
import 'package:projectunity/widget/error_snack_bar.dart';

import '../../../../navigation/app_router.dart';
import 'bloc /admin_leave_event.dart';
import 'bloc /admin_leaves_bloc.dart';
import 'bloc /admin_leaves_state.dart';

class AdminLeavesPage extends StatelessWidget {
  const AdminLeavesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<AdminLeavesBloc>()..add(AdminLeavesInitialLoadEvent()),
      child: const AdminLeavesScreen(),
    );
  }
}

class AdminLeavesScreen extends StatefulWidget {
  const AdminLeavesScreen({Key? key}) : super(key: key);

  @override
  State<AdminLeavesScreen> createState() => _AdminLeavesScreenState();
}

class _AdminLeavesScreenState extends State<AdminLeavesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).leaves_tag),
        actions: context.read<AdminLeavesBloc>().isHR?[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: const Color(0xfff5f5f5),
              child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.darkGrey,
                  ),
                  onPressed: () => context.goNamed(Routes.applyHRLeave),

            )),
          ),
        ]:null,
      ),
      body: BlocConsumer<AdminLeavesBloc, AdminLeavesState>(
        listener: (context, state) {
          if (state.status == AdminLeavesStatus.failure) {
            showSnackBar(context: context, error: state.error);
          }
        },
        builder: (context, state) => state.status == AdminLeavesStatus.loading
            ? const AppCircularProgressIndicator()
            : ListView(children: [
                ExpandableList(
                    title: AppLocalizations.of(context)
                        .admin_leaves_upcoming_leaves_tag,
                    leaveApplications: state.upcomingLeaves),
                ExpandableList(
                    title: AppLocalizations.of(context)
                        .admin_leaves_recent_leaves_tag,
                    leaveApplications: state.recentLeaves)
              ]),
      ),
      backgroundColor: AppColors.whiteColor,
    );
  }
}