import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/src/model/todo_model/todo_model.dart';
import 'package:todo_app/src/ui/dashboard/dashboard.dart';

class Todoservice{
  CollectionReference ref = FirebaseFirestore.instance.collection("Todo");
Future<String> addtodo(Todomodel todomodel,String id)async{
  await ref.doc(id.toString()).set(todomodel.toMap());
  return id;

}
  Future<Stream> deleteTodo(String id, data) async {
    return ref.doc(id).delete().asStream();
  }
}
