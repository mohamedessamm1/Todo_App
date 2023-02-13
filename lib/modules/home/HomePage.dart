import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';
import 'package:todo/modules/home/ItemTask.dart';
import 'package:todo/shared/componant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
      builder: (context,state){
      return Scaffold(

        body: Column(
          children: [
            Expanded(
                child: ItemTaskList()
            )
          ],
        ),
      );
    },
    );
  }
}
