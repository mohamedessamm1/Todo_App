import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/firestore/firestore_utils.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';
import 'package:todo/modules/Cubit/AppState.dart';

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var formkey = GlobalKey<FormState>();
          var titlecont = TextEditingController();
          var describecont = TextEditingController();
          return Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CalendarTimeline(
                    initialDate: AppCubit.get(context).SelectedDate ,
                    firstDate: DateTime.now().subtract(Duration(days: 5)),
                    lastDate:DateTime.now().add(Duration(days: 7)),
                    onDateSelected: (date){
                      AppCubit.get(context).SelectedDate = date;
                      print(AppCubit.get(context).SelectedDate.day);
                    },
                    leftMargin: 20.w,
                    monthColor: Colors.blueGrey,
                    dayColor: Colors.teal[200],
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: Colors.redAccent[100],
                    dotsColor: Color(0xFF333A47),
                    selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en_ISO',
                  ),
                  SizedBox(
                    height: 400.h,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.all(Radius.circular(20.r))),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  TextFormField(
                                    controller: titlecont,
                                    validator: (Text) {
                                      if (Text == null || Text.isEmpty) {
                                        return 'required to enter your task title';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: ' to enter your title',
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 15.w),
                                        filled: true,
                                        fillColor: Colors.grey.shade300,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .grey.shade300), //<-- SEE HERE
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .grey.shade400), //<-- SEE HERE
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r))),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  TextFormField(
                                    controller: describecont,
                                    validator: (Text) {
                                      if (Text == null || Text.isEmpty) {
                                        return 'required to enter your tast details ';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: 'enter your task details',
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 15.w),
                                        filled: true,
                                        fillColor: Colors.grey.shade300,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .grey.shade300), //<-- SEE HERE
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .grey.shade300), //<-- SEE HERE
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r))),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: Colors.red[300]),
                                      child: Center(
                                        child: Text(
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            '${AppCubit.get(context).SelectedDate.day}'
                                            '/${AppCubit.get(context).SelectedDate.month}'
                                            '/${AppCubit.get(context).SelectedDate.year}'
                                            ''),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      AppCubit.get(context).addtask(
                                          form: formkey,
                                          context: context,
                                          titlecontrol: titlecont.text,
                                          describecontrol: describecont.text);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 10.w),
                                          ],
                                        ),
                                        Center(
                                          child: Text(
                                            'save',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(300.w, 50.h),
                                        backgroundColor: Colors.indigo,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
