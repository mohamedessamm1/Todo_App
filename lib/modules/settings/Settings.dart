import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dark mode',
                style: TextStyle(
                  color: AppCubit.get(context).isdark? Colors.white:Colors.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  width: 130.w,
                  height: 90.h,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Switch(
                        activeColor: Colors.indigo,
                        inactiveThumbColor: Colors.grey.shade300,
                        value: AppCubit.get(context).isdark,
                        onChanged: (value) {
                          AppCubit.get(context).changeTheme();
                        }),
                  ))
            ],
          ),
        ));
      },
    );
  }
}
