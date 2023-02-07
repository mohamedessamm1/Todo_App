import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),

                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'enter your title',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        filled: true,
                        fillColor: Colors.grey.shade600,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: Colors.grey.shade600), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400), //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'enter your task details',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        filled: true,
                        fillColor: Colors.grey.shade600,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: Colors.grey.shade600), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400), //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  ElevatedButton(
                    onPressed: () {},
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
                            borderRadius: BorderRadius.circular(20.r))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
