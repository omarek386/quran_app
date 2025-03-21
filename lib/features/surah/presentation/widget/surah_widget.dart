import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';
import 'package:quran_app/features/home/data/sec_api.dart';
import 'package:quran_app/features/surah/repo/surah_repo.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: Color.fromARGB(52, 135, 62, 213),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.primary,
                  child: Text(
                    ayah.numberInSurah.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    SurahRepo().playAudio(ayah.audio);
                  },
                  icon: Icon(
                    Icons.play_arrow_outlined,
                    color: AppColor.primary,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          child: Text(
            ayah.text,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.h),
        Divider(),
        SizedBox(height: 10.h),
      ],
    );
  }
}
