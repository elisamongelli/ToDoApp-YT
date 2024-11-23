import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';
import 'package:todoapp/models/widgets/intray_todo_widget.dart';


class IntrayPage extends StatefulWidget {
  const IntrayPage({super.key});

  @override
  State<IntrayPage> createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: darkGreyColor,
      child: ListView(
        padding: const EdgeInsets.only(top: 230),
        children: getList(),
      ),
    );
  }
  
  List<Widget> getList() {

    List<IntrayTodo> list = [];

    for (int i = 0; i < 8; i++) {
      list.add(
        const IntrayTodo(
          "Titolo di prova",
          "Sottotitolo di prova",
        )
      );
    }

    return list;
  }
}
