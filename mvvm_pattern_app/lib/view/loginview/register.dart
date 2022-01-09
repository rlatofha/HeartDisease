import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/service/logindb.dart';
import 'package:mvvm_pattern_app/view/loginview/login.dart';


class CustomerAccount extends StatefulWidget {
  const CustomerAccount({ Key? key }) : super(key: key);

  @override
  _CustomerAccountState createState() => _CustomerAccountState();
}

class _CustomerAccountState extends State<CustomerAccount> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();


  late String id; 
  late String password;


  @override
  Widget build(BuildContext context) {
     return Scaffold(
     appBar: AppBar(),

      body: Center(
        child: Column(
          children: [

            
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 40),
            child: Image.asset('images/login_register_asset/heart_icon.png',
                fit: BoxFit.contain,
                height: 400,
                width: 400,
              ),
          ),

          

            // ID 
            Container(
              width: 300,
              child: TextField(
                controller: idcontroller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined),
                  labelText: '회원ID',
                  border: OutlineInputBorder(     
                  ),
                )
              ),
            ),

             const SizedBox(
              height: 10,
            ),

            

            // 비밀번호 
            Container(
              width: 300,
              child: TextField(
                controller: pwcontroller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  labelText: '비밀번호',
                  border:  OutlineInputBorder(     
                  ),
                ),
                obscureText: true,
              ),
            ),
           
             const SizedBox(
              height: 10,
            ),

           
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)
                ),
                onPressed: () async{
                  // LoginDBService db = LoginDBService();
                  // User? user = await db.register(idcontroller.text, pwcontroller.text);
                  // if(user != null){
                  //   _showDialog(context);
                  // }else{
                  //   errorSnackBar(context);
                  // }
                   LoginDBService db = LoginDBService();
                   int check;
                  check = await db.register(idcontroller.text, pwcontroller.text);
                  print(check);
                  if(check == 1){
                    _showDialog(context);
                  }else{
                    errorSnackBar(context);
                  }
                }, 
                child: const Text('완료')
              ),
            ),


          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('회원가입'),
            content: const Text('회원가입이 완료되었습니다.'),
            actions:[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Login();
                  }));

                },
                child: const Text('확인'),
              ),
            ],
          );
        }
      );


  }

  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('이미 등록된 email이거나 입력이 제대로 되지 않았습니다.'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}