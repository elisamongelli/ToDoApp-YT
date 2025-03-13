import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
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
      home: MyHomePage()
      // home: LoginPage(),
      // home: const MyHomePage(title: 'ToDo App'),
    );
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

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  String? globalApiKey;
  late Future<void> _initApiKey;



  @override
  void initState() {
    super.initState();
    _initApiKey = _initializeApiKey();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initApiKey,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {
          // String? apiKey = snapshot.data.toString();

          // print("Api key nel metodo build = " + apiKey.toString());
          
          return globalApiKey != null &&
                  globalApiKey != "Api Key not stored"
              ? getHomePageLayout()
              : LoginPage(redirectHomePage: redirectHomePage);
        
        } else {
        
          return Center(child: CircularProgressIndicator());
        
        }
      }
    );
  }


  void redirectHomePage() {
    setState(() {
      _initApiKey = _initializeApiKey();
      // build(context);
    });
  }


  getHomePageLayout() {

    return MaterialApp(
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
                      child: IconButton(
                          onPressed: () {
                            deleteApiKey();
                          },
                          icon: Icon(Symbols.delete_rounded)), // use delete_forever icon on "are u sure" popup
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  height: 175,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
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
                    onPressed: () {},
                    child: const Icon(
                      Symbols.add_rounded,
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
                    icon: Icon(Symbols.home_rounded),
                  ),
                  Tab(
                    icon: Icon(Symbols.person_rounded),
                  ),
                  Tab(
                    icon: Icon(Symbols.settings_rounded),
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



  Future<void> _initializeApiKey() async {
    globalApiKey = await getApiKey();
  }


  Future<String> getApiKey() async {

    // nascondere la tastiera virtuale quando si passa dal logout alla schermata di registrazione
    FocusScope.of(context).unfocus();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localApiKey = prefs.getString('Api_Token') ?? 'Api Key not stored';

    return localApiKey;
  }


  Future<void> deleteApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('Api_Token');

    setState(() {
      globalApiKey = null;
      // build(context);
    });
  }
}
