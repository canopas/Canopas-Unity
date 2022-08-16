import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:projectunity/configs/font_size.dart';

import '../../../configs/colors.dart';
import '../../../core/utils/const/image_constant.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          fixedSize: Size( MediaQuery.of(context).size.width / 1.5, 50),
          side: const BorderSide(color: AppColors.peachColor, width: 2),
          backgroundColor: AppColors.creamColor.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          primary:  AppColors.peachColor.withOpacity(0.2)
        ),
        onPressed: onPressed,
        child: Row(children: [
          Image.asset(
            googleLogoImage,
            height: 40,
          ),
           Expanded(
            child: Text(
              AppLocalizations.of(context).login_button_text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                      color: AppColors.blackColor, fontSize: titleTextSize),
            ),
          )
        ]));
  }
}