import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';
import 'package:quran_app/features/surah/presentation/widget/surah_widget.dart';

import '../../../home/data/sec_api.dart';

class SurahDetailScreen extends StatelessWidget {
  const SurahDetailScreen({super.key, required this.surah});
  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30.w, top: .30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.englishName,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      surah.englishNameTranslation,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: surah.ayahs.length,
                  itemBuilder: (context, index) {
                    return SurahWidget(ayah: surah.ayahs[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
