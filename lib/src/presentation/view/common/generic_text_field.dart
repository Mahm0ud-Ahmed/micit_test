import 'package:flutter/material.dart';
import 'package:micit_test/src/core/utils/constant.dart';

class GenericTextField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChange;
  final Function(String?)? onTab;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initValue;

  const GenericTextField({
    super.key,
    this.onChange,
    this.onTab,
    this.controller,
    required this.hintText,
    this.validator,
    this.initValue,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        controller: controller,
        initialValue: initValue,
        cursorColor: kTextPrimaryColor,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: hintText,
        ),
        onChanged: onChange,
        onSaved: onTab,
      ),
    );
  }
}
