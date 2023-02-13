import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/firestore_model.dart';
import 'package:todo/modules/Cubit/AppState.dart';
import 'package:todo/modules/home/HomePage.dart';

import 'package:todo/modules/settings/Settings.dart';
import 'dart:math';

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
  DateTime myDate= DateTime.now();

  List<Task> mytaskslist = [];
  void addtask(
      {required GlobalKey<FormState>
      form,
      context,
      titlecontrol,
      describecontrol}) {
    if (form.currentState?.validate() == true) {
      Task task = Task(
        title: titlecontrol.toString(),
        describe: describecontrol.toString(),
        date: SelectedDate.day,
      );
      addtasktofirestore(task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        print('task done ');
        emit(AddTaskState());
          });
      Navigator.pop(context);
    }
    emit(alldone());
  }
  void GetAllTasks() async {
    QuerySnapshot<Task> mytask = await GetTaskCollection().get();
    mytaskslist = mytask.docs.map((e) {
      return e.data();
    }).toList();
    emit(GetAllTasksState());
  }

  CollectionReference<Task> GetTaskCollection() {
    return FirebaseFirestore.instance.collection('4').withConverter<Task>(
        fromFirestore: ((snapshot, option) => Task.fromJson(snapshot.data()!)),
        toFirestore: (Task, option) => Task.toJson()
    );
  }

  Future <void> addtasktofirestore(Task task) {
    var collection = GetTaskCollection();
    var docref = collection.doc();
    task.id = docref.id;
    return docref.set(task);
  }


}
