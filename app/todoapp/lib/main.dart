import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ToDo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      color: Colors.yellow,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                TabBarView(
                  children: [
                    Container(
                      color: Colors.orange,
                    ),
                    Container(
                      color: darkGreyColor,
                    ),
                    Container(
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 30
                  ),
                  height: 175,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Task List",
                        style: taskListTitleStyle,
                      ),
                      Container(),
                    ],
                  )
                ),
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(
                    top: 140,
                    left: (MediaQuery.of(context).size.width * 0.5) - 35,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: redMainColor,
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    onPressed:() {
                      
                    },
                    child: const Icon(
                      CupertinoIcons.add, 
                      size: 50, 
                      color: Colors.white,
                    ),
                  ),
                )
              ] 
            ),
            appBar: AppBar(
              title: TabBar(
                tabs: const [
                  Tab(
                    icon: Icon(CupertinoIcons.home),
                  ),
                  Tab(
                    icon: Icon(CupertinoIcons.person),
                  ),
                  Tab(
                    icon: Icon(CupertinoIcons.settings),
                  )
                ],
                labelColor: Colors.orange,
                unselectedLabelColor: darkGreyColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.all(5.0),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
