import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';

class TitleBoxWidget extends StatelessWidget {
  const TitleBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 0,
          child: Image.asset(
            'assets/images/image_4.png',
            width: 207.w,
            height: 196.h,
          ),
        ),
        SizedBox(
          width: ScreenUtil().screenWidth,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Quran',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Read the Quran Easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '19:21',
                style: TextStyle(
                  fontSize: 36.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Ramadan 23, 1444 AH',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                color: AppColor.primary,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Text(
                  'Shubuh  4:17 AM',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
