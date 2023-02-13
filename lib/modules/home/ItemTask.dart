import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/models/firestore_model.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

class ItemTaskList extends  StatelessWidget {
  const ItemTaskList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(

        listener: (context,state){},
      builder: (context,state){
          return ListView.separated(
            itemBuilder:((context, index)=>Container(
              height: 115.h,
              width: 352.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0.w),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      height: 80.h,
                      width: 4.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Column(
                        children: [
                          Text(
                            '${AppCubit.get(context).mytaskslist[index].title.toString()}',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.redAccent[100]),
                          ),
                          Text(
                            '${AppCubit.get(context).mytaskslist[index].describe.toString()}',
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.white),
                          ),
                          Text(
                            '${AppCubit.get(context).mytaskslist[index].date.toString()}',
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Center(
                        child: Icon(Icons.done, color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      height: 45.h,
                      width: 69.w,
                    ),
                  ],
                ),
              ),
            )),
            itemCount: AppCubit.get(context).mytaskslist.length,
            separatorBuilder: ((context, index)=>Divider(
              height: 15.h,
            )),
          );
    },
    );
  }
}
