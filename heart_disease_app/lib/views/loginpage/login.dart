// ignore_for_file: unnecessary_new

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:heart_disease_app/views/tabbarnavigator.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late String id;
    late String password;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Color(0xff85B6FF),
              alignment: Alignment(-0.8, 0.3),
              child: Image.asset('images/logo.png'),
            ), // logo Container
      
            // Login 대문 문구
            Container(
              height: 150,
              width: double.infinity,
              color: Color(0xff85B6FF),
              alignment: Alignment(-0, 0),
              child: const Text('당신의 심장건강과\n우방좌방+ 함께합니다.',
                style: TextStyle(
                  fontFamily: "Sunflower",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5
                ),
              ),
            ), // Content(Text)
      
            // Penson 2 Icons
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: 
                  BorderRadius.only(bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                color: Color(0xff85B6FF),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Image.asset('images/login_person.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                           Image.asset('images/login_person.png',
                             height: 80,
                             width: 80,
                           ),
                ],
              ),
            ), // person Icon
      
            // UserID 값 입력 
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 300,
                    child: TextField(
                      controller: idcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ), // User ID
      
                // User Password 값 입력 
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 300,
                    child: TextField(
                      controller: idcontroller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key_rounded),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ), // User Password
      
                // 기본 Login 버튼
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(30.0)),
                        primary: const Color(0xffF38B88),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const TabbarNavigator();
                          }));},
                      child: const Text('로그인',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Sunflower",
                          letterSpacing: 6,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ), // 기본 Login 버튼
      
                // 구글 Login 버튼
                Container(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                      primary: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const TabbarNavigator();
                        }));},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset('images/google_logo.png',
                          height: 20, width: 20,),
                        ),
                        const Text('SIGN With Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Sunflower",
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // 구글 Login 버튼
      
          ], // body children
        ),
      ),
    );
  }
} // Main END

