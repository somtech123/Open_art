import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/custom_widgets/custom_widgets.dart';

class ViewArtWork extends StatelessWidget {
  const ViewArtWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            )
          ],
        ),
      ))),
    );
  }
}
