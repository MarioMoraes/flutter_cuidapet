import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButtonSocial extends StatelessWidget {
  final String title;
  final double width;
  final IconData icon;
  final Color color;
  final GestureTapCallback onTap;

  const RoundedButtonSocial({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.color,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: 50.h,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                icon,
                size: 20.w,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
