import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

import '../modules/bottomsheet.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppCubit.get(context).isdark
              ? AppBar(
                  centerTitle: true,
                  title: const Text(
                    'mawa3idy',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0.r),
                          bottomRight: Radius.circular(30.0.r))),
                  elevation: 8,
                  backgroundColor: Colors.grey.shade900,
                )
              : PreferredSize(
                  preferredSize: AppBar().preferredSize,
                  child: SafeArea(
                    child: Container(
                      color: Colors.white,
                      child: AppBar(
                        centerTitle: true,
                        title: const Text(
                          'mawa3idy',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0.r),
                                bottomRight: Radius.circular(30.0.r))),
                        elevation: 8,
                        backgroundColor: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
          body: AppCubit.get(context)
              .ScreenNavigate[AppCubit.get(context).CurrentIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo,
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: MyBottomSheet(),
                    );
                  });
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: AppCubit.get(context).MyIcons,
            activeColor: Colors.indigo,
            elevation: 5,
            height: 50.h,
            borderWidth: 1.5.w,
            splashColor: Colors.indigo,
            inactiveColor: Colors.grey.shade400,
            iconSize: 28.w,
            borderColor: Colors.grey.shade800,
            backgroundColor: AppCubit.get(context).isdark
                ? Colors.black
                : Colors.grey.shade600,
            activeIndex: AppCubit.get(context).CurrentIndex,
            gapLocation: GapLocation.center,
            leftCornerRadius: 10.w,
            rightCornerRadius: 10.w,
            blurEffect: true,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) => AppCubit.get(context).changebottomnav(index),
            //other params
          ),
        );
      },
    );
  }
}
