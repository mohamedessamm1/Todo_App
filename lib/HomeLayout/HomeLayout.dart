import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
      builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text('mawa3idy'),
              centerTitle: true,
              backgroundColor: Colors.indigo,
            ),
            body: AppCubit.get(context)
                .ScreenNavigate[AppCubit.get(context).CurrentIndex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.indigo,
              child: Icon(Icons.add),

              onPressed: () {
                AppCubit.get(context).showbottomsheet(context);
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: AppCubit.get(context).MyIcons,
              activeColor: Colors.indigo,
              elevation: 1,
              height: 50.h,
              borderWidth: 1.5.w,
              splashColor: Colors.indigo,
              inactiveColor: Colors.grey,
              iconSize: 28.w,
              borderColor: Colors.grey.shade800,
              backgroundColor: Colors.black,
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
