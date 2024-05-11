import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class HotBidCardWidget extends StatelessWidget {
  const HotBidCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      curve: Curves.fastOutSlowIn,
      width: 250.w,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r))),
      child: Column(
        children: [
          Container(
            height: 300.h,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/art2.png'))),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Inside Kings Cross',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            trailing: Container(
              height: 25.h,
              //width: 60.w,
              constraints: BoxConstraints(maxWidth: 90.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.greyScale)),
              alignment: Alignment.center,
              child: Text('2.4 ETH',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            subtitle: Text('Highest bid',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.greyScale)),
          ),
        ],
      ),
    );
  }
}
