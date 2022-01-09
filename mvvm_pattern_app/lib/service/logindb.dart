import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvm_pattern_app/model/login_model.dart';
class LoginDBService {

  // FirebaseAuth login id, password 값 확인  
  Future<User?> loginUsingEmailPassword({
    required String email, required String password, required BuildContext context}) async{
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;
      }on FirebaseAuthException catch(e){
        if(e.code == "user-not-found"){
          print("No User found for that email");
        }
      }
      return user;
    }

  // //FirebaseAuth 회원가입
  // Future<User?> register(String id, String password) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = (await auth.createUserWithEmailAndPassword(
  //     email: id,
  //     password: password,
  //   )).user;
  //   print(user);
  //   return user;
  // }

  //FirebaseAuth 회원가입
  Future<int> register(String id, String password) async {
    int check = 0;
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
        final User? user = (await auth.createUserWithEmailAndPassword(
        email: id,
        password: password,
      )).user;
      check = 1;
      return check;
    } on FirebaseAuthException catch(e){
      check = 0;
      return check;
    }
  }


  // 비밀번호 찾기 
  // Future<void> resetPassword(String id) async {
  //   final firebaseAuth = FirebaseAuth.instance;
  //   await firebaseAuth.sendPasswordResetEmail(email: id);
  // }

   Future<int> resetPassword(String id) async {
    int check = 0;
    final firebaseAuth = FirebaseAuth.instance;
    try{
      await firebaseAuth.sendPasswordResetEmail(email: id);
      check++;
      print(check);
      return check;
    } on FirebaseAuthException catch(e){
      print(check);
      return check;
    }
  }

  // google login
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(googleUser);
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  


 

    


}




















//class loginDBService{


 
  // loginRead(String id, String password) async {
    
  //     var data;
  //     var idch;
  //     var pwch;
  //     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance 
  //     .collection('Customer')
  //     .where('id', isEqualTo: id).where('password', isEqualTo: password)
  //     .get();

  //     List<QueryDocumentSnapshot> docs = snapshot.docs;
  //       for (var doc in docs) {
  //         if (doc.data() != null) {
  //           data = doc.data() as Map<String, dynamic>;
  //           id = data['id']; // You can get other data in this manner.
  //           password =data['password'];
  //           idch = id; 
  //           pwch = password;
  //           print(id);


            
            
  //           //_showDialog(context);
  //         }
  //       }
  //     }
  //   }
    
    
      
      

