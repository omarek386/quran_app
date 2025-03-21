import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/core/themes/app_color.dart';
import 'package:quran_app/features/home/presentation/widgets/select_boutton.dart';
import 'package:quran_app/features/home/presentation/widgets/surah_card.dart';
import 'package:quran_app/features/home/presentation/widgets/title_box_widget.dart';

import '../cubit/home_cubit.dart';

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
              SizedBox(height: 20.h),

              FutureBuilder(
                future: BlocProvider.of<HomeCubit>(context).getSwarData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    log('Error: ${snapshot.error}');
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.data.surahs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.surahDetail,
                                arguments: snapshot.data!.data.surahs[index],
                              );
                            },
                            child: SurahCard(
                              ayatCount:
                                  snapshot.data!.data.surahs[index].number,
                              nameArabic: snapshot.data!.data.surahs[index].name
                                  .substring(6),
                              nameEnglish:
                                  snapshot.data!.data.surahs[index].englishName,
                              revelationType:
                                  snapshot
                                      .data!
                                      .data
                                      .surahs[index]
                                      .revelationType
                                      .name,
                              accentColor: AppColor.primary,
                              number: snapshot.data!.data.surahs[index].number,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text('No Data'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
