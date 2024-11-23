import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';


class IntrayTodo extends StatelessWidget {
    
    final String? title;
    final String? subtitle;
    const IntrayTodo([this.title, this.subtitle, Key? key]) : super(key: key);

    @override
    Widget build(BuildContext context) {
    
    return Container(
        height: 100,
        margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 15,
        ),
        decoration: BoxDecoration(
            color: redMainColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10.0,
                    spreadRadius: -10.0,
                    offset: const Offset(0.0, 12.0),
                )
            ]
        ),
        child: Row(
            children: <Widget>[
                const Radio(value: true, groupValue: false, onChanged: null),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        const Padding(padding: EdgeInsets.all(10)),
                        Text(
                            title.toString(),
                            style: singleTaskTitle,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                subtitle.toString(),
                                style: singleTaskSubtitle,
                            )
                        ),
                    ],
                )
            ],
        ),
    );
  }
  
}