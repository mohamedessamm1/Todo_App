import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/firestore_model.dart';

CollectionReference<Task> GetTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
      fromFirestore: ((snapshot, option) => Task.fromJson(snapshot.data()!)),
      toFirestore: (Task, option) => Task.toJson());
}

Future <void> addtasktofirestore(Task task) {
  var collection = GetTaskCollection();
  var docref = collection.doc();
  task.id = docref.id;
  return docref.set(task);
}
