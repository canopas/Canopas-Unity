import 'package:flutter/material.dart';
import 'package:projectunity/data/core/extensions/context_extension.dart';
import 'package:projectunity/style/app_text_style.dart';
import '../../../../../data/configs/space_constant.dart';
import '../../../../../data/configs/theme.dart';

class ResponseNote extends StatelessWidget {
  final String leaveResponse;

  const ResponseNote({super.key, required this.leaveResponse});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: primaryHorizontalSpacing, vertical: primaryHalfSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.admin_leave_detail_note_tag,
              style: AppTextStyle.style16
                  .copyWith(color: context.colorScheme.textSecondary),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(5).copyWith(bottom: 4),
              decoration: BoxDecoration(
                boxShadow: AppTheme.commonBoxShadow(context),
                borderRadius: AppTheme.commonBorderRadius,
                color: context.colorScheme.primary.withValues(alpha: 0.5),
              ),
              child: Text(
                leaveResponse,
                style: AppTextStyle.style16
                    .copyWith(color: context.colorScheme.textPrimary),
              ),
            ),
          ],
        ));
  }
}
