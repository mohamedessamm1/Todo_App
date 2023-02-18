import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';
import 'package:todo/modules/home/ItemTask.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppCubit.get(context).mytaskslist.isEmpty
            ? Scaffold(
                backgroundColor:
                    AppCubit.get(context).isdark ? Colors.black : Colors.white,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'No Tasks Here',
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: AppCubit.get(context).isdark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ],
                ),
              )
            : Scaffold(
                body: Column(
                  children: const [Expanded(child: ItemTaskList())],
                ),
              );
      },
    );
  }
}
