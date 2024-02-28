import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';
import 'package:projectunity/data/core/extensions/context_extension.dart';
import 'package:projectunity/data/model/leave/leave.dart';
import 'package:projectunity/style/app_text_style.dart';
import 'package:projectunity/style/colors.dart';
import '../../../data/configs/colors.dart';
import '../../../data/configs/space_constant.dart';
import '../../../data/configs/text_style.dart';
import '../../../data/configs/theme.dart';

class PerDayDurationDateRange extends StatelessWidget {
  final Map<DateTime, LeaveDayDuration> perDayDurationWithDate;

  const PerDayDurationDateRange(
      {Key? key, required this.perDayDurationWithDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return perDayDurationWithDate.length > 2
        ? SingleChildScrollView(
            padding: const EdgeInsets.all(primaryVerticalSpacing),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: perDayDurationWithDate.entries
                  .map((date) => Container(
                        padding: const EdgeInsets.all(primaryHalfSpacing),
                        margin: const EdgeInsets.symmetric(
                          horizontal: primaryVerticalSpacing,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: containerHighColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              DateFormat('EEE', context.l10n.localeName)
                                  .format(date.key),
                            ),
                            Text(
                              DateFormat('d', context.l10n.localeName)
                                  .format(date.key),
                              style: AppFontStyle.titleDark.copyWith(
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            Text(
                              DateFormat('MMM', context.l10n.localeName)
                                  .format(date.key),
                            ),
                            const SizedBox(
                              height: primaryVerticalSpacing,
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 150,
                              ),
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: containerHighColor),
                              ),
                              child: Text(AppLocalizations.of(context)
                                  .leave_day_duration_tag(date.value.name)),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        : Column(
            children: perDayDurationWithDate.entries
                .map((date) => Container(
                    padding: const EdgeInsets.all(primaryHalfSpacing),
                    margin: const EdgeInsets.symmetric(
                      vertical: primaryHalfSpacing,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: containerHighColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                            DateFormat('EEEE, ', context.l10n.localeName)
                                .format(date.key),
                            style: AppTextStyle.style14),
                        Text(
                          DateFormat('d ', context.l10n.localeName)
                              .format(date.key),
                          style: AppTextStyle.style14.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('MMMM', context.l10n.localeName)
                              .format(date.key),
                          style: AppTextStyle.style14,
                        ),
                        const Spacer(),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 150,
                          ),
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: containerHighColor),
                          ),
                          child: Text(
                            AppLocalizations.of(context)
                                .leave_day_duration_tag(date.value.name),
                            style: AppTextStyle.style14,
                          ),
                        )
                      ],
                    )))
                .toList());
  }
}
