import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CuidaPetLogo extends StatelessWidget {
  const CuidaPetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 162.w,
        height: 130.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
