import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/widgets/intray_todo_widget.dart';

const String todoCollectionRef = "todos";

class DatabaseService {

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todosRef;


  DatabaseService() {
    
    //withConverter method allows to specify a structure for the collection
    _todosRef = _firestore.collection(todoCollectionRef).withConverter<IntrayTodo>(
      fromFirestore: (snapshots, _) => IntrayTodo.fromJson(snapshots.data()!,), 
      toFirestore: (intrayTodo, _) => intrayTodo.toJson()
    );
  }


  Stream<QuerySnapshot> getTodos() {
    return _todosRef.snapshots();
  }


  void addTodo(IntrayTodo todo) async {
    _todosRef.add(todo);
  }
}