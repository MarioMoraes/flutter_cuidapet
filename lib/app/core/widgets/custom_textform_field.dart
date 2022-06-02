import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      this.obscureText = false,
      this.controller,
      this.validator})
      : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
              labelText: hint,
              labelStyle: const TextStyle(color: Colors.black, fontSize: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                gapPadding: 0,
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                gapPadding: 0,
                borderSide: const BorderSide(color: Colors.red),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: Icon(
                        obscureTextVNValue ? Icons.lock : Icons.lock_open,
                        color: context.primaryColor,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}
