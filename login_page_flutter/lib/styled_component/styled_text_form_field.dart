import 'package:flutter/material.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField(this.label,{ super.key, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
      ),
    );
  }
}