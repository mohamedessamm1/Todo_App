import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/firestore_model.dart';
import 'package:todo/modules/Cubit/AppState.dart';
import 'package:todo/modules/home/HomePage.dart';

import 'package:todo/modules/settings/Settings.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  /////////////////////////////////////////////////////////////////
   List<Widget> ScreenNavigate = [
    const HomePage(),
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
  DateTime myDate = DateTime.now();

  List<Task> mytaskslist = [];
  void addtask(
      {required GlobalKey<FormState> form,
      context,
      titlecontrol,
      describecontrol}) {
    emit(TaskLoadingState());

    if (form.currentState?.validate() == true) {
      Task task = Task(
        title: titlecontrol.toString(),
        describe: describecontrol.toString(),
        date: SelectedDate.day,
      );
      addtasktofirestore(task).timeout(const Duration(milliseconds: 500),
          onTimeout: () {
        emit(TaskSuccesState());
      }).catchError((error) {
        emit(TaskerrorState());
      });
      Navigator.pop(context);
    }
  }

  void GetAllTasks() {
    emit(GetAllTasksLoadingState());
    GetTaskCollection().get().then((value) {
      mytaskslist = value.docs.map((e) {
        return e.data();
      }).toList();
      emit(GetAllTasksDoneState());
    }).catchError((error) {
      emit(GetAllTasksErorrState());
    });
  }

  CollectionReference<Task> GetTaskCollection() {
    emit(GetCollectionLoadingState());
    return FirebaseFirestore.instance.collection('1').withConverter<Task>(
        fromFirestore: ((snapshot, option) => Task.fromJson(snapshot.data()!)),
        toFirestore: (Task, option) => Task.toJson());
  }

  Future<void> addtasktofirestore(Task task) {
    emit(AddTASKLoadingState());
    var collection = GetTaskCollection();
    var docref = collection.doc();
    task.id = docref.id;
    print(task.id);
    return docref.set(task).then((value) {
      emit(AddTASKdoneState(task));
    });
  }

  Future<void> DeleteTask(Task task) {
    print(task.id);
    emit(DeleteTaskLoadingState());
    return GetTaskCollection().doc(task.id).delete().then((value) {
      emit(DeleteTaskDoneState());
    }).catchError((error) {
      emit(DeleteTaskErrorState());
    });
  }

  bool isdark = false;
  void changeTheme() {
    isdark = !isdark;
    emit(IsDarkState());
  }
}
