// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/utils/app_constants/app_color.dart';
import 'package:open_art/utils/app_constants/responsive.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Function? onPressed;
  final Color? backgroundColor;
  final Color? accentColor;
  final Color? borderColor;
  bool hideBorder;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;

  SecondaryButton(
      {super.key,
      required this.label,
      this.labelColor,
      required this.onPressed,
      this.backgroundColor,
      this.accentColor,
      this.hideBorder = false,
      this.borderColor,
      this.topLeftRadius,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      this.topRightRadius});

  MaterialStateProperty<T> changeButtonStyle<T>(style) =>
      MaterialStateProperty.all<T>(style);

  @override
  Widget build(BuildContext context) {
    final fs = fullScreen(context);
    final h = sHeight(context);

    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: changeButtonStyle<Size>(Size(
          fs('width'),
          h(40.0),
        )),
        animationDuration: const Duration(microseconds: 1300),
        backgroundColor:
            changeButtonStyle<Color>(backgroundColor ?? Colors.white),
        overlayColor: changeButtonStyle<Color>(
          accentColor ?? AppColors.buttonOverlay,
        ),
        shape: changeButtonStyle<OutlinedBorder>(
          // hideBorder == false
          //     ? RoundedRectangleBorder(
          //         side: BorderSide.none,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(topLeftRadius ?? 10.r),
          //             bottomLeft: Radius.circular(bottomLeftRadius ?? 10.r),
          //             bottomRight: Radius.circular(bottomRightRadius ?? 10.r),
          //             topRight: Radius.circular(topRightRadius ?? 10.r)))
          //     :
          RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.0, color: borderColor ?? AppColors.primaryColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius ?? 10.r),
                  bottomLeft: Radius.circular(bottomLeftRadius ?? 10.r),
                  bottomRight: Radius.circular(bottomRightRadius ?? 10.r),
                  topRight: Radius.circular(topRightRadius ?? 10.r))),
        ),
        elevation: changeButtonStyle<double>(0.0),
      ),
      onPressed: onPressed == null ? null : () => onPressed!(),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15,
              color: labelColor ?? Colors.black,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Function? onPressed;
  final Color? backgroundColor;
  final Color? accentColor;
  final Color? borderColor;
  bool hideBorder;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;

  PrimaryButton(
      {super.key,
      required this.label,
      this.labelColor,
      required this.onPressed,
      this.backgroundColor,
      this.accentColor,
      this.hideBorder = false,
      this.borderColor,
      this.topLeftRadius,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      this.topRightRadius});

  @override
  Widget build(BuildContext context) {
    final fs = fullScreen(context);
    final h = sHeight(context);

    return Container(
      width: fs('width'),
      height: h(40.0),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0038F5),
              Color(0xFF9F03FF),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 10.r),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 10.r),
              bottomRight: Radius.circular(bottomRightRadius ?? 10.r),
              topRight: Radius.circular(topRightRadius ?? 10.r))),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(microseconds: 1300),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius ?? 10.r),
                  bottomLeft: Radius.circular(bottomLeftRadius ?? 10.r),
                  bottomRight: Radius.circular(bottomRightRadius ?? 10.r),
                  topRight: Radius.circular(topRightRadius ?? 10.r))),
        ),
        onPressed: onPressed == null ? null : () => onPressed!(),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15,
                color: labelColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
