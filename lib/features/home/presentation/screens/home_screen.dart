import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran_app/features/home/presentation/widgets/select_boutton.dart';
import 'package:quran_app/features/home/presentation/widgets/title_box_widget.dart';

import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeInitial) {
            log('HomeInitial');
            context.read<HomeCubit>().getSwarData();
          } else if (state is HomeError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is HomeLoading,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleBoxWidget(),
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SelectButton(),
                    SizedBox(height: 20.h),
                    state is HomeLoaded
                        ? Expanded(
                          child: ListView.builder(
                            itemCount: state.swar.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(state.swar[index].name),
                              );
                            },
                          ),
                        )
                        : TextButton(
                          onPressed:
                              () => context.read<HomeCubit>().getSwarData(),
                          child: Text('Retry'),
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
