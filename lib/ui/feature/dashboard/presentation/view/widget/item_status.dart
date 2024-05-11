// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/app/resouces/art_status.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/custom_widgets/custom_widgets.dart';
import 'package:open_art/ui/shared/primary_button.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class ItemStatus extends StatelessWidget {
  ItemStatus({super.key, required this.artStatus});

  ArtStatus artStatus;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: artStatus == ArtStatus.SOLD
          ? Container(
              height: 130.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.offWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0.0, 1.0),
                    blurRadius: 6.r,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Sold for ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    title: Text(
                      '1.50 ETH',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                    trailing: Text('\$2,683.73',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.greyScale)),
                  ),
                  ListTile(
                    leading: Text(
                      'Owner by ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    title:
                        nameTagContainer(context, initial: 'D', name: '@David'),
                  )
                ],
              ),
            )
          : artStatus == ArtStatus.AUCTION
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: AppColors.offWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0.0, 1.0),
                        blurRadius: 6.r,
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reserve Price',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 20)),
                      RichText(
                          text: TextSpan(
                              text: '1.50 ETH ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24),
                              children: [
                            TextSpan(
                                text: '\$2,683.73',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: AppColors.greyScale))
                          ])),
                      SizedBox(height: 10.h),
                      Text(
                          'Once a bid has been placed and the reserve price has been met, a 24 hour auction for this artwork will begin.',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 12)),
                      SizedBox(height: 10.h),
                      PrimaryButton(label: 'Place a Bid', onPressed: () {}),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              : artStatus == ArtStatus.OPENBID
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: AppColors.offWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: const Offset(0.0, 1.0),
                            blurRadius: 6.r,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Current Bid',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                          RichText(
                              text: TextSpan(
                                  text: '1.50 ETH ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24),
                                  children: [
                                TextSpan(
                                    text: '\$2,683.73',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: AppColors.greyScale))
                              ])),
                          SizedBox(height: 10.h),
                          Text('Auction ending in',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              countDown(context, time: '10', count: 'hour'),
                              countDown(context, time: '30', count: 'minutes'),
                              countDown(context, time: '25', count: 'seconds')
                            ],
                          ),
                          SizedBox(height: 20.h),
                          PrimaryButton(label: 'Place a Bid', onPressed: () {}),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
    );
  }
}

Widget countDown(BuildContext context,
    {required String time, required String count}) {
  return Column(
    children: [
      Text(
        time,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
      ),
      Text(
        count,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
      )
    ],
  );
}
