import 'package:flutter/material.dart';
import 'package:micit_test/src/core/utils/extension.dart';
import 'package:micit_test/src/data/models/user_model.dart';

import '../../../common/generic_text_field.dart';
import '../../../common/text_widget.dart';
import '../controller/home_controller.dart';

class UserForm extends StatefulWidget {
  final BoxConstraints constraints;
  final HomeController homeController;
  final UserModel? user;
  final int? index;
  const UserForm({
    super.key,
    required this.constraints,
    required this.homeController,
    this.user,
    this.index,
  });

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  void initState() {
    super.initState();
    widget.homeController.initFieldsControllers();
    if (widget.user != null) {
      widget.homeController.firstNameController!.text = widget.user!.firstName;
      widget.homeController.lastNameController!.text = widget.user!.lastName;
      widget.homeController.emailController!.text = widget.user!.email;
    }
  }

  @override
  void dispose() {
    widget.homeController.disposeFieldsControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.homeController.formKey,
      child: Column(
        children: [
          (widget.constraints.maxHeight * .08).h,
          GenericTextField(
            controller: widget.homeController.firstNameController,
            hintText: 'First Name',
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'First Name is required';
              }
              return null;
            },
          ),
          (widget.constraints.maxHeight * .035).h,
          GenericTextField(
            controller: widget.homeController.lastNameController,
            hintText: 'Last Name',
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Last Name is required';
              }
              return null;
            },
          ),
          (widget.constraints.maxHeight * .035).h,
          GenericTextField(
            controller: widget.homeController.emailController,
            hintText: 'Email',
            validator: (p0) {
              final RegExp _emailRegex = RegExp(
                r"^((([a-z]|\d|[!#\$%&'*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
              );
              if (p0!.isEmpty) {
                return 'Email is required';
              } else if (!_emailRegex.hasMatch(p0.toLowerCase())) {
                return 'Invalid Email';
              }
              return null;
            },
          ),
          (widget.constraints.maxHeight * .05).h,
          ElevatedButton(
            onPressed: () {
              if (widget.homeController.formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                widget.user != null
                    ? widget.homeController.updateUser(widget.user!, widget.index!)
                    : widget.homeController.addUser();

                Navigator.of(context).pop();
              }
            },
            child: TextWidget(text: widget.user == null ? 'Add User' : 'Update User'),
          ),
        ],
      ),
    );
  }
}
