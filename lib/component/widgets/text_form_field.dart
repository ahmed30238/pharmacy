import 'package:flutter/material.dart';
class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final InputBorder? border; // outline or underLine
  final String? Function(String? value) validator;
  final bool? filled;
  final Function(String? value)? onSubmitted;
  const DefaultTextFormField({
    Key? key,
    this.controller,
    required this.validator,
    this.filled,
    this.labelText,
    this.onSubmitted,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        filled: filled,
        border: border,
        labelText: labelText,
      ),
    );
  }
}