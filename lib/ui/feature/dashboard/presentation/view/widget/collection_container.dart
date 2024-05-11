import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectioContainer extends StatelessWidget {
  const CollectioContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 165.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/collections.png'),
        ),
      ),
    );
  }
}
