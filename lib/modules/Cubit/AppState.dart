import 'package:todo/models/firestore_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavChangeState extends AppStates {}

class showBottomSheetState extends AppStates {}

class ChooseDateState extends AppStates {}

class TaskSuccesState extends AppStates {}

class TaskerrorState extends AppStates {}

class TaskLoadingState extends AppStates {}

class GetAllTasksDoneState extends AppStates {}

class GetAllTasksErorrState extends AppStates {}

class GetAllTasksLoadingState extends AppStates {}

class alldone extends AppStates {}

class AddTASKLoadingState extends AppStates {}

class AddTASKdoneState extends AppStates {
  final Task task;

  AddTASKdoneState(this.task);
}

class GetCollectionLoadingState extends AppStates {}

class DeleteTaskLoadingState extends AppStates {}

class DeleteTaskDoneState extends AppStates {}

class DeleteTaskErrorState extends AppStates {}

class ChangeMyColorState extends AppStates {}

class IsDarkState extends AppStates {}
