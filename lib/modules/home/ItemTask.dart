import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/firestore_model.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

class ItemTaskList extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(

        listener: (context,state){},
      builder: (context,state){
          Task? task;
          return Padding(
            padding:  EdgeInsets.only(top: 30.h),
            child: ListView.separated(
              itemBuilder:((context, index)=>Slidable(
                // Specify a key if the Slidable is dismissible.
                key: const ValueKey(0),

                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context){
                        print(AppCubit.get(context));
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_rounded,
                      borderRadius: BorderRadius.all(Radius.circular(22.r)),
                      label: 'Delete',
                    ),
                  ],
                ),

                // The end action pane is the one at the right or the bottom side.
                // The child of the Slidable is what the user sees when the
                // component is not dragged.
                child:   Padding(
                  padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                  child: Container(
                    height: 115.h,
                    width: 400.w,
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
                  ),
                ),
              )),
              itemCount: AppCubit.get(context).mytaskslist.length,
              separatorBuilder: ((context, index)=>Divider(
                height: 15.h,
              )),
            ),
          );
    },
    );
  }
}
