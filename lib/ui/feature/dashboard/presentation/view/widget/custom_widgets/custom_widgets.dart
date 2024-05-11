import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

Widget artContainer(BuildContext context) => Container(
      height: 300.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          image: const DecorationImage(
              image: AssetImage('assets/images/product1.png'),
              fit: BoxFit.cover)),
    );

Widget circularButton(BuildContext context, {required Widget child}) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 40.h,
        width: 40.h,
        margin: EdgeInsets.only(bottom: 6.r),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.offWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0.0, 1.0),
                blurRadius: 6.r,
              ),
            ]),
        alignment: Alignment.center,
        child: child,
      ),
    );

Widget customcontainer(
  BuildContext context,
) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
          height: 40.h,
          width: 140.w,
          margin: EdgeInsets.only(bottom: 6.r),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0.0, 1.0),
                blurRadius: 6.r,
              ),
            ],
            borderRadius: BorderRadius.circular(24.r),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(5.h),
          child: Row(
            children: [
              Container(
                height: 30.h,
                width: 30.w,
                decoration: const BoxDecoration(
                    color: Colors.amber, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  'H',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                '@openart',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
