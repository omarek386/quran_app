import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/core/themes/app_color.dart';
import 'package:quran_app/features/home/presentation/cubit/home_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getSwarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Spacer(flex: 10),
          Image.asset('assets/images/quran_1.jpg', width: 149.w, height: 195.h),
          SizedBox(
            width: ScreenUtil().screenWidth,
            child: Text(
              'My Quran',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                color: AppColor.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            'Baca Al-Quran Degan Mudah',
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColor.secondaryFont,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(flex: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(181.w, 45.h)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(AppColor.primary),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
            child: Text(
              'Baca Sekarang',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
