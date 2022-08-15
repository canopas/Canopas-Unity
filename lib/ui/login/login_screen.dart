import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:projectunity/configs/colors.dart';
import 'package:projectunity/configs/font_size.dart';
import 'package:projectunity/di/service_locator.dart';
import 'package:projectunity/ui/login/widget/widget_sign_in_button.dart';

import '../../bloc/login/login_bloc.dart';
import '../../core/utils/const/image_constant.dart';
import '../../rest/api_response.dart';
import '../../stateManager/login_state_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _bloc = getIt<LoginBloc>();
  final _loginState = getIt<LoginState>();
  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginPageBackgroundImage), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<ApiResponse<bool>>(
            stream: _bloc.loginResponse,
            initialData: const ApiResponse.idle(),
            builder: (context, snapshot) {
              snapshot.data!.when(
                  idle: () {},
                  loading: () {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        _showProgress = true;
                      });
                    });
                  },
                  completed: (bool hasAccount) {
                    if (hasAccount) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          _showProgress = false;
                        });
                        _loginState.setUserLogin(hasAccount);
                      });
                    }
                  },
                  error: (String error) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        _showProgress = false;
                      });
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(error),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _bloc.reset();
                    });
                  });

              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Column(
                              children: [
                                buildTitle(),
                                buildSubTitle(),
                              ],
                            ),
                          ),
                          buildImage(context),
                          Column(children: [
                             Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .login_guide_description,
                                style: const TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: bodyTextSize),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            _showProgress
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : SignInButton(onPressed: _bloc.signIn),
                          ]),
                        ]),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              loginPageVectorImage,
            ),
          ),
        ));
  }

  Text buildSubTitle() {
    return Text(
      AppLocalizations.of(context).login_toUnity_text,
      style: const TextStyle(
          fontSize: appTitleTextSize,
          letterSpacing: 1,
          color: AppColors.blackColor,
          height: 1),
    );
  }

  Text buildTitle() {
    return Text(
      AppLocalizations.of(context).login_welcome_text,
      style: const TextStyle(
          height: 2,
          fontSize: appTitleTextSize,
          color: AppColors.blackColor,
          fontStyle: FontStyle.italic),
    );
  }
}
