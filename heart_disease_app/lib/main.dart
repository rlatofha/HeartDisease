import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:heart_disease_app/views/loginpage/login.dart';

void main() {
  runApp(const MyApp());
}

// void main() => runApp(const GetMaterialApp(home: MyHomePage()));

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
  // route 설정
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const Login();
        },
      },
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
