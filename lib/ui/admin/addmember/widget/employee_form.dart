import 'package:flutter/material.dart';
import 'package:projectunity/bloc/admin/employee/employee_validation.dart';
import 'package:projectunity/configs/font_size.dart';
import 'package:projectunity/di/service_locator.dart';
import 'package:projectunity/ui/admin/addmember/widget/role_toggle_button.dart';

import '../../../../configs/colors.dart';
import '../../../../core/utils/const/role.dart';

class EmployeeForm extends StatefulWidget {
  int selectedRole;

  EmployeeForm({Key? key, required this.selectedRole}) : super(key: key);

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final EmployeeValidationBloc _bloc = getIt<EmployeeValidationBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30,
          top: 40,
        ),
        child: Column(
          children: [
            ToggleButton(
              onRoleChange: (role) {
                switch (role) {
                  case kRoleTypeEmployee:
                    setState(() {
                      widget.selectedRole = kRoleTypeEmployee;
                    });
                    break;
                  case kRoleTypeHR:
                    setState(() {
                      widget.selectedRole = kRoleTypeHR;
                    });
                }
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleText(title: 'Employee Id'),
                    CustomTextField(
                        hintText: 'CA1001',
                        stream: _bloc.employeeId,
                        onChanged: (employeeId) =>
                            _bloc.validateEmployeeId(employeeId)),
                    const TitleText(title: 'Member Name'),
                    CustomTextField(
                        hintText: 'Andrew Jhone',
                        stream: _bloc.name,
                        onChanged: (name) => _bloc.validateName(name)),
                    const TitleText(title: 'Email'),
                    CustomTextField(
                        hintText: 'andrew@canopas.com',
                        stream: _bloc.email,
                        onChanged: (email) => _bloc.validateEmail(email)),
                    const TitleText(title: 'Designation'),
                    CustomTextField(
                        hintText: 'Android developer',
                        stream: _bloc.designation,
                        onChanged: (designation) =>
                            _bloc.validateDesignation(designation)),
                    Container(
                      height: 200,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
            fontSize: subTitleTextSize,
            color: AppColors.secondaryText,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  Stream<String>? stream;
  final String hintText;
  void Function(String) onChanged;

  CustomTextField(
      {Key? key,
      required this.stream,
      required this.onChanged,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
          cursorColor: Colors.black,
          autocorrect: false,
          style: const TextStyle(
              fontSize: subTitleTextSize, color: AppColors.darkText),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
            hintStyle: const TextStyle(
                fontSize: subTitleTextSize, color: AppColors.secondaryText),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hintText,
          ),
        );
      },
    );
  }
}
