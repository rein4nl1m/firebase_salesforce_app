import 'package:flutter/material.dart';

class PaddingTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? inputType;
  final TextInputAction? action;
  final String? Function(String?)? validator;
  final bool isObscure;
  final Widget? suffix;

  const PaddingTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.inputType,
    this.action,
    this.validator,
    this.isObscure = false,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: suffix,
        ),
        textInputAction: action,
        keyboardType: inputType,
        validator: validator,
        obscureText: isObscure,
      ),
    );
  }
}
