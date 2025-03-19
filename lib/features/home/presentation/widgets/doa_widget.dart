import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';

import 'star_shap.dart';

class DoaCard extends StatelessWidget {
  final int number;
  final String nameEnglish;
  final String revelationType;
  final Color? accentColor;

  const DoaCard({
    super.key,
    required this.number,
    required this.nameEnglish,
    required this.revelationType,

    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = accentColor ?? AppColor.primary;

    return Row(
      spacing: 8.w,
      children: [
        Container(
          width: 7.w, // Adjust width as needed
          height: 68.h, //Adjust the hieght
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              12.r,
            ), // Rounded corners for the bar
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 13.w),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Soft shadow
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 16.w), // Space between bar and star
                StarWithNumber(number: number, starColor: color),
                SizedBox(width: 16.w), // Space between star and text
                // Middle: Surah Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameEnglish,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Doa',
                        style: TextStyle(fontSize: 15.sp, color: color),
                      ),
                      Row(
                        children: [
                          Text(
                            revelationType.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Icon(
                              Icons.circle,
                              size: 4.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Right Side: Arabic Text
              ],
            ),
          ),
        ),
      ],
    );
  }
}
