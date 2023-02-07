import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/HomeLayout/HomeLayout.dart';
import 'package:todo/modules/Cubit/AppCubit.dart';

import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, screenUtil) {
        return BlocProvider(
          create: (context)=>AppCubit(),
          child: MaterialApp(
                theme: ThemeData(
                    fontFamily: 'cairo',
                    primaryColor: const Color(0xff1a7b8c),
                    appBarTheme: AppBarTheme(
                      backgroundColor: Colors.black,
                      centerTitle: true,
                      iconTheme: IconThemeData(color: Colors.white),


                    ),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(


                    ),
                    scaffoldBackgroundColor: Colors.black
                ),

                debugShowCheckedModeBanner: false,
                home: HomeLayout(),
              ),
        );
      },
    );
  }
}


