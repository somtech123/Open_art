import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_art/app/resouces/art_status.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/custom_widgets/custom_widgets.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/item_status.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class ViewArtWork extends StatelessWidget {
  const ViewArtWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            artContainer(context),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Silent Color',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    circularButton(context,
                        child: const Icon(CupertinoIcons.heart)),
                    SizedBox(
                      width: 10.w,
                    ),
                    circularButton(context,
                        child: SvgPicture.asset('assets/svgs/Export.svg'))
                  ],
                )
              ],
            ),
            customcontainer(context),
            Text(
              'Together with my design team, we designed this futuristic Cyberyacht concept artwork. We wanted to create something that has not been created yet, so we started to collect ideas of how we imagine the Cyberyacht could look like in the future.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w),
                        child: hashtagContainer(context, text: '#Art'),
                      )),
            ),
            SizedBox(height: 10.h),
            _customContainer(context,
                svgPath: 'assets/images/bsc.png',
                title: 'View on Etherscan',
                isImg: true),
            _customContainer(context,
                svgPath: 'assets/svgs/Star_border.svg', title: 'View on IPFS'),
            _customContainer(context,
                svgPath: 'assets/svgs/Chart-pie.svg',
                title: 'View IPFS Metadata'),
            SizedBox(height: 10.h),
            ItemStatus(artStatus: ArtStatus.OPENBID),
            SizedBox(height: 20.h),
            Text('Activity',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 20)),
            ListView.builder(
              itemBuilder: (context, index) => _activityTile(context),
              itemCount: 3,
              shrinkWrap: true,
            )
          ],
        ),
      ))),
    );
  }
}

Widget _customContainer(BuildContext context,
    {required String svgPath, required String title, bool? isImg = false}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5.0),
    child: Container(
      height: 40.h,
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
      child: ListTile(
        leading: isImg == true
            ? Image.asset(svgPath, height: 15.h)
            : SvgPicture.asset(svgPath, height: 15.h),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        trailing: SvgPicture.asset(
          'assets/svgs/open_link.svg',
          height: 15.h,
        ),
      ),
    ),
  );
}

Widget _activityTile(BuildContext context) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: SvgPicture.asset(
          'assets/svgs/open_link.svg',
          height: 15.h,
        ),
        leading: Container(
          height: 30.h,
          width: 30.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFF0038F5),
                Color(0xFF9F03FF),
              ],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            'H',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        title: Text(
          'Bid place by @pawel09',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'June 04, 2021 at 12:00am',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 10, fontWeight: FontWeight.w500),
            ),
            RichText(
                text: TextSpan(
                    text: '1.50 ETH ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                    children: [
                  TextSpan(
                      text: '\$2,683.73',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: AppColors.greyScale))
                ])),
          ],
        ),
      ),
    ],
  );
}
