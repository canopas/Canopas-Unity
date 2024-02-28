import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectunity/data/configs/space_constant.dart';
import 'package:projectunity/data/configs/text_style.dart';
import 'package:projectunity/data/configs/theme.dart';
import 'package:projectunity/gen/assets.gen.dart';
import 'package:projectunity/style/app_text_style.dart';
import 'package:projectunity/style/colors.dart';

import '../../../../../data/configs/colors.dart';

class DatePickerCard extends StatelessWidget {
  final Function() onPress;
  final String title;
  final DateTime date;

  const DatePickerCard({
    Key? key,
    required this.onPress,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(primaryHalfSpacing),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: containerHighColor))),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                Assets.images.icCalendar,
                colorFilter: const ColorFilter.mode(
                    textDisabledColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.style14.copyWith(color: textDisabledColor),
                  ),
                  const SizedBox(height: 5,),
                  Text(localization.date_format_yMMMd(date),
                      style: AppTextStyle.style18.copyWith(textBaseline: TextBaseline.alphabetic)),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
