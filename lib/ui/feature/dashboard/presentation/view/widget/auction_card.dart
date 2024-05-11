import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/feature_card.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Column(
        children: [
          const FeatureCard(),
          SizedBox(height: 15.h),
          Container(
            height: 40.h,
            alignment: Alignment.center,
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
            child: RichText(
              text: TextSpan(
                  text: 'Sold for ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyScale),
                  children: [
                    TextSpan(
                      text: '2.00 ETH',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyScale),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
