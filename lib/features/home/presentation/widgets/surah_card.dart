import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';

import 'star_shap.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            width: 7.w, // Adjust width as needed
            height: 68.h, //Adjust the hieght
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(
                12.r,
              ), // Rounded corners for the bar
            ),
          ),
          const SizedBox(width: 16), // Space between bar and star
          StarWithNumber(number: 1, starColor: AppColor.primary),
          const SizedBox(width: 16), // Space between star and text
          // Middle:  Surah Information
          Expanded(
            //  Expanded to take available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Al-Fatihah',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4), // Space between title and subtitle
                Row(
                  //Mekah and 7 ayat
                  children: [
                    Text(
                      'MEKAH',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        Icons.circle,
                        size: 4,
                        color: Colors.grey[600],
                      ), // Use a small circle icon
                    ),
                    Text(
                      '7 AYAT',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right Side: Arabic Text
          const Text(
            'الفاتحة', // Replace with actual Arabic text
            style: TextStyle(
              fontSize: 20,
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
