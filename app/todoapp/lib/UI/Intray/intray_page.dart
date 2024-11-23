import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';


class IntrayPage extends StatefulWidget {
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

    List<Container> list = [];

    for (int i = 0; i < 2; i++) {
      list.add(
        Container(
          color: Colors.red,
          height: 100,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
        ),
      );
      list.add(
        Container(
          color: Colors.orange,
          height: 100,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10
          ),
        ),
      );
      list.add(
        Container(
          color: Colors.yellow,
          height: 100,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10
          ),
        ),
      );
    }

    return list;
    /* return [
      Container(
        color: Colors.red,
        height: 100,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
      ),
      Container(
        color: Colors.orange,
        height: 100,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10
        ),
      ),
      Container(
        color: Colors.yellow,
        height: 100,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10
        ),
      ),
      Container(
        color: Colors.red,
        height: 100,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10
        ),
      ),
      Container(
        color: Colors.orange,
        height: 100,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10
        ),
      ),
      Container(
        color: Colors.yellow,
        height: 100,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10
        ),
      ),
    ]; */
  }
}
