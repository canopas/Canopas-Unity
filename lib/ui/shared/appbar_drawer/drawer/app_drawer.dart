import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:projectunity/data/core/extensions/string_extension.dart';
import 'package:projectunity/ui/navigation/app_router.dart';
import 'package:projectunity/ui/shared/appbar_drawer/drawer/widget/drawer_option.dart';
import 'package:projectunity/ui/shared/appbar_drawer/drawer/widget/drawer_space_card.dart';
import 'package:projectunity/ui/shared/appbar_drawer/drawer/widget/drawer_user_profile_card.dart';
import 'package:projectunity/ui/widget/error_snack_bar.dart';
import 'package:projectunity/ui/widget/widget_validation.dart';
import '../../../../data/configs/colors.dart';
import '../../../../data/configs/text_style.dart';
import '../../../../data/core/utils/bloc_status.dart';
import '../../../../data/di/service_locator.dart';
import '../../../../data/provider/user_data.dart';
import '../../../widget/app_dialog.dart';
import '../../../widget/circular_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'bloc/app_drawer_bloc.dart';
import 'bloc/app_drawer_event.dart';
import 'bloc/app_drawer_state.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final UserManager userManager = getIt<UserManager>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerBloc, DrawerState>(
      listenWhen: (previous, current) =>
          current.error.isNotNullOrEmpty ||
          current.changeSpaceStatus == Status.success ||
          current.changeSpaceStatus == Status.error,
      listener: (context, state) {
        if (state.error.isNotNullOrEmpty ||
            state.changeSpaceStatus == Status.error) {
          context.pop();
          showSnackBar(context: context, error: state.error);
        } else if (state.changeSpaceStatus == Status.success) {
          context.pop();
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
          color: AppColors.whiteColor,
        ),
        constraints: const BoxConstraints(
          maxWidth: 300,
          minWidth: 200,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.8,
        child: SafeArea(
          child: Material(
            color: AppColors.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProfileCard(
                  currentEmployee: userManager.employee,
                  currentSpace: userManager.currentSpace!,
                ),
                SpaceList(userEmail: userManager.userEmail!),
                const Divider(height: 0),
                DrawerOptionList(isSpaceOwner: userManager.isSpaceOwner, isAdminOrHr: userManager.isAdmin || userManager.isHR),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerOptionList extends StatelessWidget {
  final bool isSpaceOwner;
  final bool isAdminOrHr;

  const DrawerOptionList(
      {Key? key, required this.isSpaceOwner, required this.isAdminOrHr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ValidateWidget(
            isValid: isSpaceOwner,
            child: DrawerOption(
                icon: Icons.edit_note_rounded,
                title: locale.edit_space_button_tag,
                onTap: () {
                  context.pop();
                  context.pushNamed(Routes.editWorkspaceDetails);
                }),
          ),
          DrawerOption(
              icon: Icons.person_outline_rounded,
              title: locale.view_profile_button_tag,
              onTap: () {
                context.pop();
                context.goNamed(isAdminOrHr ? Routes.adminProfile : Routes.userProfile);
              }),
          BlocBuilder<DrawerBloc, DrawerState>(
            buildWhen: (previous, current) =>
                previous.signOutStatus != current.signOutStatus,
            builder: (context, state) => DrawerOption(
                icon: Icons.logout_rounded,
                title: locale.sign_out_tag,
                onTap: () {
                  showAlertDialog(
                    context: context,
                    actionButtonTitle: locale.sign_out_tag,
                    onActionButtonPressed: () {
                      context.read<DrawerBloc>().add(SignOutEvent());
                    },
                    title: locale.sign_out_tag,
                    description: locale.sign_out_alert,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class SpaceList extends StatelessWidget {
  final String userEmail;

  const SpaceList({Key? key, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Expanded(
      child: BlocBuilder<DrawerBloc, DrawerState>(
          buildWhen: (previous, current) =>
              previous.fetchSpacesStatus != current.fetchSpacesStatus,
          builder: (context, state) {
            if (state.fetchSpacesStatus == Status.loading) {
              return const ThreeBounceLoading(
                color: AppColors.primaryBlue,
                size: 20,
              );
            } else if (state.fetchSpacesStatus == Status.success) {
              if (state.spaces.isEmpty) {
                return const SizedBox();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(locale.spaces_list_title(userEmail),
                        style:
                            AppFontStyle.subTitleGrey.copyWith(fontSize: 16)),
                  ),
                  const Divider(height: 0),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 11),
                      itemCount: state.spaces.length,
                      itemBuilder: (context, index) => DrawerSpaceCard(
                        logo: state.spaces[index].logo,
                        name: state.spaces[index].name,
                        onTap: () => context
                            .read<DrawerBloc>()
                            .add(ChangeSpaceEvent(state.spaces[index])),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          }),
    );
  }
}
