import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';


class IntrayTodo extends StatelessWidget {
    
    final String title;
    final String notes;
    final Key key;

    const IntrayTodo(this.title, this.notes, this.key) : super(key: key);
    //IntrayTodo({this.keyValue, this.title, this.subtitle});


    @override
    Widget build(BuildContext context) {
    
        return Container(
            //key: Key(keyValue),
            height: 100,
            margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 7.5,
                top: 7.5
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
                                      "$key - $notes",
                                      style: singleTaskSubtitle,
                                  )
                              ),
                          ],
                      )
                  ],
              ),
        );
    } 


    IntrayTodo.fromJson(Map<String, Object?> json) : this(
      json['title']! as String,
      json['notes']! as String,
      json['key'] as Key
    );


    Map<String, Object> toJson() {
      return {
        'title': title,
        'notes': notes,
        'key': key.toString()
      };
    }
  
}