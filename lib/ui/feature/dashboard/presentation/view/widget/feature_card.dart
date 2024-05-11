import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Color(0x00000014),
              offset: Offset(0, 10),
              blurRadius: 24,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        children: [
          Container(
            height: 320.h,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/product1.png'))),
          ),
          SizedBox(height: 10.h),
          ListTile(
            contentPadding: EdgeInsets.only(left: 10.h, right: 10.h),
            leading: Container(
              height: 50.h,
              width: 50.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/creator.JPG'))),
            ),
            title: Text(
              'Pawal Czar',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              'Creator',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(CupertinoIcons.heart),
          )
        ],
      ),
    );
  }
}
