import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/modelview/health_list_view_model.dart';
import 'package:mvvm_pattern_app/view/loginview/login.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/listview_provider.dart';
import 'package:mvvm_pattern_app/view/tabbarview/tabbarnavigator.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(const MyApp());
  // provider가 화면이동해서 값을 이동 해주기 위해서는 가장 상위 폴더에 위치해 있어야 된다.
   runApp(   
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HealthListViewModel()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // route 설정 
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) {
          //return const Login();
          return const TabbarNavigator();
        },
      },
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
