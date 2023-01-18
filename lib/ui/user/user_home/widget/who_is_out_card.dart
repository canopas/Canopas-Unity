import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/theme.dart';
import '../../../../core/utils/const/space_constant.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../widget/circular_progress_indicator.dart';
import '../bloc/user_home_state.dart';
import '../bloc/user_home_event.dart';
import '../bloc/user_home_bloc.dart';

class WhoIsOutCard extends StatelessWidget {
  const WhoIsOutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: primaryVerticalSpacing),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: AppTheme.commonBorderRadius,
        color: AppColors.whiteColor,
        boxShadow: AppTheme.commonBoxShadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(primaryHorizontalSpacing),
            child: Text(
              AppLocalizations.of(context).who_is_out_card_title,
              style: AppTextStyle.titleDark,
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
            indent: primaryHorizontalSpacing,
            endIndent: primaryHorizontalSpacing,
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: primaryHorizontalSpacing,
                vertical: primaryVerticalSpacing),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<UserHomeBloc>().add(ChangeToBeforeDateEvent());
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18)),
                BlocBuilder<UserHomeBloc, UserHomeState>(
                    buildWhen: (previous, current) =>
                        previous.dateOfAbsenceEmployee !=
                        current.dateOfAbsenceEmployee,
                    builder: (context, state) => SizedBox(
                          width: 110,
                          child: Center(
                            child: Text(
                              DateFormatter(AppLocalizations.of(context)).getDateRepresentation(state.dateOfAbsenceEmployee),
                              style: AppTextStyle.mediumDark,
                            ),
                          ),
                        )),
                IconButton(
                    onPressed: () {
                      context.read<UserHomeBloc>().add(ChangeToAfterDateEvent());
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    )),
                const Spacer(),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 30,
                    highlightElevation: 0,
                    elevation: 0,
                    color: AppColors.lightPrimaryBlue,
                    onPressed: () {
                      ///TODO open absence employee list of selected employee
                    },
                    child: Text(
                      AppLocalizations.of(context).see_all_button_tag,
                      style: AppTextStyle.bodyDark,
                    )),
              ],
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
            indent: primaryHorizontalSpacing,
            endIndent: primaryHorizontalSpacing,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(
            height: primaryVerticalSpacing,
          ),
          BlocBuilder<UserHomeBloc, UserHomeState>(
            builder: (context, state) => state.status ==
                    UserHomeStatus.loading
                ? const Padding(
                    padding: EdgeInsets.all(primaryHorizontalSpacing),
                    child: AppCircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: state.absence.isEmpty?CrossAxisAlignment.center:CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                      padding:  EdgeInsets.all(state.absence.isEmpty?0:primaryVerticalSpacing).copyWith(bottom: 0),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: state.absence
                                            .map((e) => Container(
                                                  margin: const EdgeInsets.symmetric(horizontal: primaryVerticalSpacing),
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    image: (e.employee.imageUrl != null)
                                                            ? DecorationImage(image: NetworkImage(e.employee.imageUrl!),)
                                                            : null,
                                                    color: AppColors.primaryGray,
                                                    borderRadius: AppTheme.commonBorderRadius,
                                                  ),
                                                  child: (e.employee.imageUrl != null)
                                                      ? null
                                                      : const Icon(Icons.person, size: 30, color: Colors.black54),
                                                )).toList(),
                                      ),
                                    ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: primaryHorizontalSpacing,
                                    vertical: primaryVerticalSpacing),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .who_is_out_card_message(
                                          DateFormatter(
                                                  AppLocalizations.of(context))
                                              .getDateRepresentation(
                                                  state.dateOfAbsenceEmployee),
                                          state.absence.length,
                                          state.absence.length - 1,
                                          (state.absence.isEmpty)
                                              ? ""
                                              : state.absence.first.employee.name),
                                  style: AppTextStyle.mediumDark,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
