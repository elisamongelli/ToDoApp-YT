import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/classes/task.dart';

const String todoCollectionRef = "todos";

class DatabaseService {

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todosRef;


  DatabaseService() {
    
    //withConverter method allows to specify a structure for the collection
    _todosRef = _firestore.collection(todoCollectionRef).withConverter<Task>(
      fromFirestore: (snapshots, _) => Task.fromJson(snapshots.data()!,), 
      toFirestore: (intrayTodo, _) => intrayTodo.toJson()
    );
  }


  Stream<QuerySnapshot> getTodos() {
    return _todosRef.snapshots();
  }


  void addTodo(Task todo) async {
    _todosRef.add(todo);
  }
}