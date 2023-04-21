import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:projectunity/data/configs/text_style.dart';

import '../../../widget/employee_details_textfield.dart';
import '../bloc/create_workspace_bloc.dart';
import '../bloc/create_workspace_event.dart';
import '../bloc/create_workspace_state.dart';
import 'org_logo_view.dart';

class SpaceBasicDetails extends StatefulWidget {
  final void Function()? onNextButtonPressed;

  const SpaceBasicDetails({
    Key? key,
    this.onNextButtonPressed,
  }) : super(key: key);

  @override
  State<SpaceBasicDetails> createState() => _SpaceBasicDetailsState();
}

class _SpaceBasicDetailsState extends State<SpaceBasicDetails>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bloc = BlocProvider.of<CreateSpaceBLoc>(context);
    final locale = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.create_space_enter_space_details_text,
            style: AppFontStyle.titleDark,
          ),
          const SizedBox(
            height: 30,
          ),
          OrgLogoView(imageURl: null, onButtonTap: () {}),
          const SizedBox(height: 32),
          BlocBuilder<CreateSpaceBLoc, CreateSpaceState>(
              buildWhen: (previous,current)=>previous.companyName!= current.companyName,
              builder: (context, state) {
                return FieldEntry(
                  hintText: AppLocalizations.of(context).company_name_tag,
                  errorText: state.companyNameError
                      ? locale.create_space_invalid_name_error
                      : null,
                  onChanged: (String? value) {
                    bloc.add(CompanyNameChangeEvent(companyName: value ?? ''));
                  },
                );
              }),
          const SizedBox(height: 20),
          BlocBuilder<CreateSpaceBLoc, CreateSpaceState>(
              buildWhen: (previous,current)=>previous.domain!= current.domain,

              builder: (context, state) {
                return FieldEntry(
                  hintText:
                  AppLocalizations.of(context).create_space_Website_url_label,
                  errorText: state.domainError
                      ? locale.create_space_invalid_website_url_error
                      : null,
                  onChanged: (String? value) {
                    bloc.add(CompanyDomainChangeEvent(domain: value));
                  },
                );
              }),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
