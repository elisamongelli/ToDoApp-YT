import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:todoapp/UI/Intray/intray_page.dart';
import 'models/global.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  print("GOOGLE API: " + GoogleApiAvailability.instance.checkGooglePlayServicesAvailability().toString());

  if(kIsWeb) {
    await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyBukYjbKKF_LNEF1iOU_tzM3_9tX5ksCbA",
      authDomain: "todoapp-46ec2.firebaseapp.com",
      projectId: "todoapp-46ec2",
      storageBucket: "todoapp-46ec2.firebasestorage.app",
      messagingSenderId: "164597516683",
      appId: "1:164597516683:web:550cd8d6c10c72e188478e"
    ));
  } else {
    await Firebase.initializeApp();
  }
  
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
                    const IntrayPage(),
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
