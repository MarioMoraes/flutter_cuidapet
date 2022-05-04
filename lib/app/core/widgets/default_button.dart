import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? labelColor;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const DefaultButton({
    Key? key,
    required this.label,
    this.color,
    this.labelColor,
    this.width = 100,
    this.height = 40,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color ?? context.primaryColor,
          elevation: 8,
        ),
        child: Text(
          label,
          style: TextStyle(color: labelColor ?? Colors.white),
        ),
      ),
    );
  }
}
