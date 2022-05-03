import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  const CustomTextFormField(
      {Key? key,
      required this.hint,
      this.obscure = false,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _obscureVN = ValueNotifier<bool>(false);

    return ValueListenableBuilder(
      valueListenable: _obscureVN,
      builder: (_, obscureVN, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: _obscureVN.value,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: obscure
                ? IconButton(
                    onPressed: () {
                      _obscureVN.value = !_obscureVN.value;
                    },
                    icon: Icon(
                      _obscureVN.value ? Icons.lock : Icons.lock_open,
                      color: context.primaryColor,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
