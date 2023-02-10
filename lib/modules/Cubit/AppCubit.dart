
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/firestore/firestore_utils.dart';
import 'package:todo/models/firestore_model.dart';
import 'package:todo/modules/Cubit/AppState.dart';
import 'package:todo/modules/home/HomePage.dart';
import 'package:todo/modules/settings/Settings.dart';


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
  void addtask({required GlobalKey<FormState> form,context,titlecontrol,describecontrol}) {
    if (form.currentState?.validate() == true) {
      Task task =   Task(
          title: titlecontrol.toString(),
          describe: describecontrol.toString(),
          date: SelectedDate.microsecondsSinceEpoch,
   );
      addtasktofirestore(task).timeout(Duration(milliseconds: 500),
      onTimeout: (){
        print('task done ');
        Navigator.pop(context);
      }
      );

  }
  }


}

