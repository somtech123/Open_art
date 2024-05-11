import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/view_art_work.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/auction_card.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/collection_container.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/feature_card.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/hot_bid_card.dart';
import 'package:open_art/ui/feature/discover/presentation/discover.dart';
import 'package:open_art/ui/shared/primary_button.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class DashboardLoadedStateView extends StatefulWidget {
  const DashboardLoadedStateView({super.key});

  @override
  State<DashboardLoadedStateView> createState() =>
      _DashboardLoadedStateViewState();
}

class _DashboardLoadedStateViewState extends State<DashboardLoadedStateView> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Discover, collect, and sell',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greyScale),
                  ),
                  //
                  Text('Your Digital Art',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: AppColors.textColor)),

                  //: TODO: search bar
                  SizedBox(height: 20.h),

                  // Feature
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FeatureCard(),
                      RichText(
                        text: TextSpan(
                            text: 'Reserve Price ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.greyScale),
                            children: [
                              TextSpan(
                                  text: '1.50 ETH ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                          color: AppColors.textColor),
                                  children: [
                                    TextSpan(
                                      text: '\$2,683.73',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: AppColors.greyScale),
                                    )
                                  ])
                            ]),
                      ),
                      SizedBox(height: 10.h),
                      PrimaryButton(label: 'Place a Bid', onPressed: () {}),
                      SizedBox(height: 5.h),
                      SecondaryButton(
                          label: 'View artWork',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ViewArtWork(),
                            ));
                          },
                          hideBorder: true)
                    ],
                  )
                ],
              ),

              // BID
            ),
            SizedBox(height: 35.h),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/svgs/Ellipse 2.svg'),
                  SizedBox(width: 5.w),
                  Text(
                    'Live auctions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ],
              ),
              trailing: Container(
                height: 30.h,
                width: 80.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.greyScale, width: 1)),
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyScale),
                ),
              ),
            ),
            Column(children: List.generate(7, (index) => AuctionCard())),

            // HOT BID
            SizedBox(height: 15.h),
            ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/svgs/hot.svg'),
                    SizedBox(width: 5.w),
                    Text(
                      'Hot bid',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease),
                        icon: const Icon(Icons.arrow_back)),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease),
                      icon: const Icon(Icons.arrow_forward),
                    )
                  ],
                )),

            SizedBox(height: 10.h),
            SizedBox(
              height: 370.h,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: const HotBidCardWidget(),
                  );
                },
                itemCount: 3,
              ),
            ),

            //

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/svgs/star.svg'),
                  SizedBox(width: 5.w),
                  Text(
                    'Hot Collection',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.w),
                  itemBuilder: (_, index) => const CollectioContainer(),
                  itemCount: 4,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Water and sunflower',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                    Container(
                      height: 20.h,
                      constraints: BoxConstraints(maxWidth: 80.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                          border:
                              Border.all(color: AppColors.greyScale, width: 1)),
                      child: Text(
                        '30 items',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyScale),
                      ),
                    ),
                  ],
                ),

                //

                SizedBox(height: 10.h),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: Container(
                    height: 25.h,
                    constraints: BoxConstraints(maxWidth: 85.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5.r),
                        border:
                            Border.all(color: AppColors.greyScale, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(CupertinoIcons.heart, size: 20),
                        Text(
                          'Follow',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyScale),
                        ),
                      ],
                    ),
                  ),
                  title: Text('By Rodion Kutsaev',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor)),
                  leading: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/creator.JPG'))),
                  ),
                ),

                ///
                ///

                SizedBox(height: 20.h),

                SecondaryButton(
                  label: 'View more Collection',
                  onPressed: () {},
                ),

                SizedBox(height: 50.h),

                SvgPicture.asset('assets/svgs/Logo.svg'),

                RichText(
                  text: TextSpan(
                      text: 'The New ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                          ),
                      children: [
                        TextSpan(
                            text: 'Creative ',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                            children: [
                              TextSpan(
                                text: 'Economy',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                              )
                            ])
                      ]),
                ),

                SizedBox(height: 20.h),

                PrimaryButton(label: 'Earn now', onPressed: () {}),
                SizedBox(height: 10.h),

                SecondaryButton(
                    label: 'Discover More',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DiscoverScreen(),
                      ));
                    }),

                SizedBox(height: 40.h)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
