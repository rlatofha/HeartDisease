import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:mvvm_pattern_app/model/login_model.dart';
// import 'package:mvvm_pattern_app/modelview/loginmodelview.dart';
import 'package:mvvm_pattern_app/service/logindb.dart';
import 'package:mvvm_pattern_app/view/loginview/register.dart';
import 'package:mvvm_pattern_app/view/tabbarview/homepage/home.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/tabbarnavigator.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {

    late String id;
    late String password;
    String check = "";

    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Login Image
            Image.asset('images/login_register_asset/account_icon.png',
              fit: BoxFit.contain,
              height: 300,
              width: 300,
            ),
            
            // UserID 값 입력 
              Container(
                width: 300,
                child: TextField(
                  controller: idcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                    labelText: 'UserID',
                    border: OutlineInputBorder(
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

            // PW 값 입력 
              Container(
                width:300,
                child: TextField(
                  controller: pwcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key_outlined),
                    labelText: 'Password',
                    border: OutlineInputBorder(  
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true, // 글자 타이핑 감추기
                ),
              ),

              // 비밀번호 찾기 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap:() async{
                        pwseachshowDialog(context);
                    },
                    child: const Text('비밀번호를 잊어버렸습니까?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ),
                ),
              ),

                // 로그인 버튼 
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[300])
                  ),
                  onPressed: () async{
                    LoginDBService db = LoginDBService();
                    User? user = await db.loginUsingEmailPassword(email: idcontroller.text, password: pwcontroller.text, context: context);
                    if(user != null){
                      _showDialog(context);
                    }else{
                      errorSnackBar(context);
                    }
                  }, 
                  child: const Text('로그인')
                ),

                const SizedBox(
                  width: 40,
                ),

                // 회원가입 버튼
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[300])
                  ),
                  onPressed: (){
                      // 회원가입  페이지 이동 및 alert 뜨기 
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const CustomerAccount();
                    }));
                  }, 
                  child: const Text('회원가입')
                ),

                ],
              ),
            ),


            // 구글 로그인 버튼 
            ElevatedButton.icon(
                onPressed: (){
                  LoginDBService db = LoginDBService();
                  db.signInWithGoogle();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const TabbarNavigator();
                  }));
                }, 
                icon: Image.asset('images/login_register_asset/google_icon.png',
                  width: 30,
                  height: 20,
                  fit: BoxFit.contain,
                  ),
                label: const Text("Sign in with Google",
                  style: TextStyle(
                    fontSize: 15, 
                    color: Colors.black
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),

             // apple  로그인 버튼 
             ElevatedButton.icon(
                onPressed: (){
                  //signInWithNaver();
                }, 
                icon: Image.asset('images/login_register_asset/apple_icon.png',
                  width: 35,
                  height: 30,
                  fit: BoxFit.contain,
                  color: Colors.white,
                  ),
                label: const Text("Sign in with APPLE",
                  style: TextStyle(
                    fontSize: 15, 
                    color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              // widget
          ],
        ),
      ),
      
    );
  }
  // 비밀번호 찾기 Dialog 
  pwseachshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('비밀번호 찾기'),
          content: TextField(
            controller: searchcontroller,
            decoration: const InputDecoration(
                labelText:'아이디 입력',
                border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text
          ),
          actions:[
              TextButton(
                onPressed: () async{
                  int check = 0;
                  LoginDBService db = LoginDBService();
                  check = await db.resetPassword(searchcontroller.text.toString());
                  if(check == 1){
                    pwemailshowDialog(context);
                  }else{
                    pwemailErrorshowDialog(context);
                  }
                },
                child: const Text('확인'),
              ),
            ],
        );
      }
    );
  }

  //비밀번호 찾기 
  pwemailshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('전송결과'),
            content: const Text('회원님의 email로 비밀번호 전송이 완료되었습니다.'),
            actions:[
              TextButton(
                onPressed: (){
                  //Navigator.of(context).pop();
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

    //비밀번호 찾기 
  pwemailErrorshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('전송결과'),
            content: const Text('일치하는 아이디가 없습니다 다시 확인해주시기 바랍니다.'),
            actions:[
              TextButton(
                onPressed: (){
                  //Navigator.of(context).pop();
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

   


  // 로그인 완료
  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('로그인'),
            content: const Text('로그인이 완료되었습니다.'),
            actions:[
              TextButton(
                onPressed: (){
                  Message.id = idcontroller.text;
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const TabbarNavigator();
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
        content: Text('사용자 정보 입력에 문제가 발생 하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

 
   








}






// logout 기능 
// void signOut() async {
//     await firebaseAuth.signOut().then((value) => {
//       setState(() {
//         user = null;
//       })
//     });
//   }