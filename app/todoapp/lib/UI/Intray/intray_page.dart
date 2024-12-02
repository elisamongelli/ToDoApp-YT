import 'package:flutter/material.dart';
import 'package:todoapp/models/classes/task.dart';
import 'package:todoapp/models/global.dart';
import 'package:todoapp/models/widgets/intray_todo_widget.dart';


class IntrayPage extends StatefulWidget {
  const IntrayPage({super.key});

  @override
  State<IntrayPage> createState() => _IntrayPageState();
}


class _IntrayPageState extends State<IntrayPage> {

  late List<Task> taskList = [];


  _IntrayPageState() {
    taskList = getList();
  }

  
  @override
  Widget build(BuildContext context) {

    return Container(
      color: darkGreyColor,
      child: ReorderableListView(
          proxyDecorator: (child, index, animation) {
            return Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: ScaleTransition(
                scale: animation.drive(
                  Tween(begin: 1.0, end: 1.03).chain(
                    CurveTween(curve: Curves.linear),
                  )
                ),
                child: child,
              ),
            );
          },
          padding: const EdgeInsets.only(top: 230),
          onReorder: _onReorder,
          children: taskList,
        ),
      // ),
    );
  }


  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> getList() {

    for (int i = 0; i < 11; i++) {
      taskList.add(
        Task(
          "Titolo di prova",
          "Note di prova",
          false,
          ValueKey(i)
        )
      );
    }

    return taskList;
  }
}

/* 
class _IntrayPageState extends State<IntrayPage> {

  List<IntrayTodo> list = [];
  
  @override
  Widget build(BuildContext context) {
    
    //list = getList();

    return Container(
      color: darkGreyColor,
      child: ListView(
        padding: const EdgeInsets.only(top: 230),
        children: getList(),//list.map((IntrayTodo item) => _buildListTile(context, item)).toList(),
      ) /* _buildReorderableListView(context), *//* ReorderableListView(
        padding: const EdgeInsets.only(top: 230),
        onReorder: _onReorder,
        children: list,
      ), */
    );
  }


  /* Widget _buildListTile(BuildContext context, IntrayTodo item) {
    
    return ListTile(
      key: Key(item.keyValue),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
    );
  } */


  /* Widget _buildReorderableListView(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.only(top: 230),
      children: list.map((IntrayTodo item) => _buildListTile(context, item)).toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          IntrayTodo item = list[oldIndex];
          list.remove(item);
          list.insert(newIndex, item);
        });
      },
    );
  } */


  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final IntrayTodo item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }


  
  List<IntrayTodo> getList() {

    for (int i = 0; i < 11; i++) {
      list.add(
        IntrayTodo(
          keyValue: i.toString(), 
          title: "Titolo di prova", 
          subtitle: "Sottotitolo di prova"
        )
      );
    }

    return list;
  }
} */