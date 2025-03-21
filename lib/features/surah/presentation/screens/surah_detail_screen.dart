import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';
import 'package:quran_app/features/surah/presentation/widget/surah_widget.dart';
import 'package:quran_app/features/surah/repo/surah_repo.dart';

import '../../../home/data/sec_api.dart';

class SurahDetailScreen extends StatefulWidget {
  const SurahDetailScreen({super.key, required this.surah});
  final Surah surah;

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  @override
  void initState() {
    super.initState();
    // audioPlayer controller
    AudioPlayer audioPlayer = SurahRepo().audioPlayer;
    audioPlayer.onPlayerComplete.listen((event) {
      audioPlayer.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 40.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.surah.englishName,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.surah.englishNameTranslation,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.surah.ayahs.length,
                  itemBuilder: (context, index) {
                    return SurahWidget(ayah: widget.surah.ayahs[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
