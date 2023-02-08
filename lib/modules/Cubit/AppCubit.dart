import 'package:bottom_sheet/bottom_sheet.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/modules/Cubit/AppState.dart';
import 'package:todo/modules/home/HomePage.dart';
import 'package:todo/modules/settings/Settings.dart';

import '../bottomsheet.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  /////////////////////////////////////////////////////////////////
  List<Widget> ScreenNavigate = [
    HomePage(),
    settings(),
  ];

  List<IconData> MyIcons = [
    Icons.home_outlined,
    Icons.settings,
  ];

////////////////////////////////////////////////////////////////////////////////
  int CurrentIndex = 0;

  void changebottomnav(index) {
    CurrentIndex = index;
    emit(AppBottomNavChangeState());
  }

  void showbottomsheet(context) {
    showFlexibleBottomSheet(

      context: context,
      builder: buildBottomSheet,
    );
    emit(showBottomSheetState());
  }

  Widget buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return MyBottomSheet();
  }

  DateTime SelectedDate = DateTime.now();
  void ChooseDate(context) async {
    var choosendate = await showDatePicker(
        context: context,
        initialDate: SelectedDate,
        firstDate: SelectedDate,
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosendate != null) {
      SelectedDate = choosendate;
    }
    emit(ChooseDateState());
  }
}
