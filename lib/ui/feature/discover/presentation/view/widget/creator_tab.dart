import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dashboardTab(BuildContext context,
    {required Color? color,
    required Gradient? gradient,
    required String title,
    required Color textbg}) {
  return Container(
    height: 30.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: gradient,
        color: color),
    alignment: Alignment.center,
    child: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: textbg),
    ),
  );
}
