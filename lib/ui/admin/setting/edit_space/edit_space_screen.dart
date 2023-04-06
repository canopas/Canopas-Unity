import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:projectunity/ui/navigation/app_router.dart';
import 'package:projectunity/ui/widget/circular_progress_indicator.dart';
import '../../../../data/configs/colors.dart';
import '../../../../data/configs/theme.dart';
import '../../../../data/di/service_locator.dart';
import '../../../widget/app_dialog.dart';
import '../../../widget/employee_details_textfield.dart';
import '../../../widget/error_snack_bar.dart';
import 'bloc/edit_space_bloc.dart';
import 'bloc/edit_space_event.dart';
import 'bloc/edit_space_state.dart';

class EditSpacePage extends StatelessWidget {
  const EditSpacePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditSpaceBloc>()..add(EditSpaceInitialEvent()),
      child: const EditSpaceScreen(),
    );
  }
}

class EditSpaceScreen extends StatefulWidget {
  const EditSpaceScreen({Key? key}) : super(key: key);

  @override
  State<EditSpaceScreen> createState() => _EditSpaceScreenState();
}

class _EditSpaceScreenState extends State<EditSpaceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _paidTimeOffLeaveController =
      TextEditingController();

  @override
  void initState() {
    ///TODO: add initial data for edit workspace
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _domainController.dispose();
    _paidTimeOffLeaveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).space_tag),
        actions: [
          BlocBuilder<EditSpaceBloc, EditSpaceState>(
              builder: (context, state) => TextButton(
                  onPressed: state.isValid ? () {} : null,
                  child: Text(AppLocalizations.of(context).save_tag))),
          const SizedBox(width: 10)
        ],
      ),
      body: BlocListener<EditSpaceBloc, EditSpaceState>(
        listener: (context, state) {
          if (state.fetchDataStatus == Status.failure ||
              state.deleteWorkSpaceStatus == Status.failure) {
            showSnackBar(context: context, error: state.error);
          }
          if (state.deleteWorkSpaceStatus == Status.success) {
            context.goNamed(Routes.joinSpace);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OrgLogoView(imageURl: null, onButtonTap: () {}),
              const SizedBox(height: 30),
              FieldEntry(
                onChanged: (name) => context
                    .read<EditSpaceBloc>()
                    .add(CompanyNameChangeEvent(companyName: name)),
                controller: _nameController,
                hintText: AppLocalizations.of(context).company_name_tag,
              ),
              const SizedBox(height: 20),
              FieldEntry(
                controller: _domainController,
                hintText:
                    AppLocalizations.of(context).create_space_Website_url_label,
              ),
              const SizedBox(height: 20),
              FieldEntry(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (timeOff) => context
                    .read<EditSpaceBloc>()
                    .add(YearlyPaidTimeOffChangeEvent(timeOff: timeOff)),
                controller: _paidTimeOffLeaveController,
                hintText: AppLocalizations.of(context).yearly_paid_time_off_tag,
              ),
              const DeleteSpaceButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteSpaceButton extends StatelessWidget {
  const DeleteSpaceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      child: BlocBuilder<EditSpaceBloc, EditSpaceState>(
        buildWhen: (previous, current) => previous.deleteWorkSpaceStatus != current.deleteWorkSpaceStatus,
        builder: (context, state) => state.deleteWorkSpaceStatus ==
                Status.loading
            ? const AppCircularProgressIndicator()
            : TextButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.redColor,
                ),
                child: Text(AppLocalizations.of(context).delete_space_text),
                onPressed: () => showAlertDialog(
                  title: AppLocalizations.of(context).delete_space_text,
                  context: context,
                  actionButtonTitle:
                      AppLocalizations.of(context).delete_space_text,
                  description: AppLocalizations.of(context)
                      .delete_dialog_description_text,
                  onActionButtonPressed: () =>
                      context.read<EditSpaceBloc>().add(DeleteSpaceEvent(
                          ///TODO Provide workspace id
                          workspaceId: "")),
                ),
              ),
      ),
    );
  }
}

class _OrgLogoView extends StatelessWidget {
  final void Function()? onButtonTap;

  final String? imageURl;

  const _OrgLogoView({Key? key, this.onButtonTap, this.imageURl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: const Alignment(1.5, 1.5),
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.textFieldBg, width: 3),
                color: AppColors.textFieldBg,
                borderRadius: AppTheme.commonBorderRadius,
                image: imageURl == null
                    ? null
                    : DecorationImage(
                        image: NetworkImage(imageURl!),
                        fit: BoxFit.cover,
                      )),
            child: imageURl != null
                ? null
                : const Icon(Icons.business,
                    color: AppColors.secondaryText, size: 45),
          ),
          IconButton(
            style: IconButton.styleFrom(
                fixedSize: const Size(45, 45),
                side: const BorderSide(color: AppColors.textFieldBg, width: 3),
                backgroundColor: AppColors.whiteColor),
            onPressed: onButtonTap,
            icon: const Icon(
              Icons.edit,
              size: 20,
              color: AppColors.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
