// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class DiscoverCard extends StatelessWidget {
  DiscoverCard({super.key, required this.ontap});

  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 350.h,
          decoration: BoxDecoration(
            color: AppColors.tabColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              // HEADER IMAGE

              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r)),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 120.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/art1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: MediaQuery.of(context).size.width / 2 - 48.w,
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        height: 93.h,
                        width: 93.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/creator.JPG'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // SUB ITEM

              Text(
                'Kennedy Yanko',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Text(
                  'Kennedy Yanko is an artist working in found metal and paint skin. Her methods reflect a dual abstract expressionist-surr…',
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: '2024 ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: 'Followers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ])),
                    Container(
                      height: 30.h,
                      width: 70.w,
                      decoration:
                          BoxDecoration(color: AppColors.offWhite, boxShadow: [
                        BoxShadow(
                            color: AppColors.offWhite,
                            blurRadius: 13.r,
                            spreadRadius: 0),
                        BoxShadow(
                            color: AppColors.offWhite,
                            blurRadius: 106.r,
                            spreadRadius: 0),
                      ]),
                      alignment: Alignment.center,
                      child: Text(
                        'Follow',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
