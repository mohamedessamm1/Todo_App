import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime(2023, 1, 1),
            firstDate: DateTime(2023, 1, 1),
            lastDate: DateTime(2023, 12, 30),
            onDateSelected: (date) => print(date),
            leftMargin: 20.w,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
           Expanded(
             child: ListView.separated(
                itemBuilder:
          ((context, index) =>Container(
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
                                'play football',
                                style:
                                TextStyle(fontSize: 20.sp, color: Colors.redAccent[100]),
                              ),
                              Text(
                                'monday',
                                style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
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
                )
                    ),
                separatorBuilder: ((context, index) =>Divider(height: 15.h,)),
                itemCount: 10),
           )
        ],
      ),
    );
  }
}
