import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/UI/Intray/intray_page.dart';
import 'package:todoapp/UI/Login/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'models/assets/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    getUser();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: getApiKey(), 
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            
            String? apiKey = snapshot.data;
            return apiKey == null || apiKey != "Api Key non salvata" ? MyHomePage(title: "Task List") : LoginPage();

          } else {
            
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
      // home: LoginPage(),
      // home: const MyHomePage(title: 'ToDo App'),
      /* home: FutureBuilder(
        future: getUser(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.none && snapshot.hasData == null) {
            print('project snapshot data is: ${snapshot.data}');
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  // Widget to display the list of project
                ],
              );
            },
          );
        },
      ), */
    );
  }



  Future<String> getApiKey() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localApiKey = prefs.getString('Api_Token') ?? 'Api Key non salvata';
    
    return localApiKey;
  }


  Future getUser() async {
    // TODO: check if there is an api_key on device
    // if no api_key --> login screen
    // if api_key --> app screen

    var result = await http.get(Uri.parse('http://10.0.2.2:5000/api/signup'));
    // print("IL RISULTATO DELLA CHIAMATA E': " + result.body.toString());
    return result;
    
    /* String apiKey = await getApiKey();
    if (apiKey.length == 0) {
      // user is NOT logged in --> login screen
    } else {
      // user is logged in --> home screen with GET request
    } */
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
                    IntrayPage(),
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