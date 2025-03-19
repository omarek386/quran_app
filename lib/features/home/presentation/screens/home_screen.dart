import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/home/presentation/widgets/doa_widget.dart';
import 'package:quran_app/features/home/presentation/widgets/select_boutton.dart';
import 'package:quran_app/features/home/presentation/widgets/surah_card.dart';
import 'package:quran_app/features/home/presentation/widgets/title_box_widget.dart';

import '../../../../core/themes/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleBoxWidget(),
              Text(
                'Categories',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SelectButton(),
              SurahCard(
                number: 1,
                nameEnglish: 'Al-Fatiha',
                nameArabic: 'الفاتحة',
                revelationType: 'Meccan',
                ayatCount: 7,
              ),
              DoaCard(
                number: 1,
                nameEnglish: 'nameEnglish',
                revelationType: 'revelationType',
                accentColor: AppColor.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
