import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

class ItemTaskList extends StatelessWidget {
  const ItemTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: ListView.separated(
            itemBuilder: ((context, index) => Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          CherryToast(
                                  icon: Icons.delete,
                                  displayCloseButton: false,
                                  themeColor: Colors.red,
                                  title: const Text('your task deleted successfully'),
                                  displayTitle: true,
                                  toastPosition: Position.bottom,
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  autoDismiss: true)
                              .show(context);

                          AppCubit.get(context).DeleteTask(
                              AppCubit.get(context).mytaskslist[index]);
                          AppCubit.get(context).GetAllTasks();
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Container(
                      height: 140.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, top: 4.h, bottom: 2.h),
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
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          AppCubit.get(context).mytaskslist[index].title.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 26.sp,
                                              color: Colors.indigo),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          maxLines: 3,
                                          AppCubit.get(context).mytaskslist[index].describe.toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    'Day: ${AppCubit.get(context).mytaskslist[index].date.toString()}',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              height: 45.h,
                              width: 69.w,
                              child: AnimatedIconButton(
                                disabledColor: Colors.red,
                                icons: const [
                                  AnimatedIconItem(
                                    icon: Icon(Icons.done, color: Colors.white),
                                  )
                                ],
                                onPressed: () {
                                  CherryToast(
                                          icon: Icons.done,
                                          themeColor: Colors.green,
                                          title: const Text('done'),
                                          displayTitle: true,
                                          displayCloseButton: false,
                                          toastPosition: Position.bottom,
                                          animationDuration:
                                              const Duration(milliseconds: 1000),
                                          autoDismiss: true)
                                      .show(context);
                                  AppCubit.get(context).DeleteTask(
                                      AppCubit.get(context).mytaskslist[index]);
                                  AppCubit.get(context).GetAllTasks();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
            itemCount: AppCubit.get(context).mytaskslist.length,
            separatorBuilder: ((context, index) => Divider(
                  height: 15.h,
                )),
          ),
        );
      },
    );
  }
}
