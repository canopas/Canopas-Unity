import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:projectunity/ui/user/settings/settings_screen/widget/user_settings_settings_options.dart';
import 'package:projectunity/ui/user/settings/settings_screen/widget/user_settings_user_profile.dart';
import 'package:projectunity/ui/widget/app_dialog.dart';
import '../../../../data/configs/colors.dart';
import '../../../../data/configs/space_constant.dart';
import '../../../../data/configs/text_style.dart';
import '../../../../data/di/service_locator.dart';
import '../../../navigation/app_router.dart';
import '../../../widget/error_snack_bar.dart';
import 'bloc/user_settings_bloc.dart';
import 'bloc/user_settings_event.dart';
import 'bloc/user_settings_state.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserSettingsBloc>(),
      child: const UserSettingsScreen(),
    );
  }
}

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings_tag),
      ),
      body: BlocConsumer<UserSettingsBloc, UserSettingsState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == UserSettingsStatus.failure) {
            showSnackBar(context: context, error: state.error);
          }
        },
        builder: (context, state) => ListView(
          padding: const EdgeInsets.all(primaryHorizontalSpacing),
          children: [
            UserProfile(
              employee: state.currentEmployee,
              onTap: () {
                context.goNamed(Routes.userEditProfile,
                    extra: state.currentEmployee);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: primaryHorizontalSpacing,
                  bottom: primaryVerticalSpacing),
              child: Text(AppLocalizations.of(context).settings_tag,
                  style: AppFontStyle.titleDark),
            ),
            const Divider(
                color: AppColors.dividerColor, height: 1, thickness: 1),
            const SizedBox(height: primaryVerticalSpacing),
            SettingOption(
                icon: Icons.logout_rounded,
                title: AppLocalizations.of(context).sign_out_tag,
                onTap: () {
                  showAlertDialog(
                    actionButtonTitle:
                        AppLocalizations.of(context).sign_out_tag,
                    onActionButtonPressed: () {
                      context
                          .read<UserSettingsBloc>()
                          .add(UserSettingsLogOutEvent());
                    },
                    context: context,
                    title: AppLocalizations.of(context).sign_out_tag,
                    description: AppLocalizations.of(context).sign_out_alert,
                  );
                })
          ],
        ),
      ),
      backgroundColor: AppColors.whiteColor,
    );
  }
}
