import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_pattern_app/model/todo_list.dart';

class HealthTest extends StatefulWidget {
  const HealthTest({ Key? key }) : super(key: key);

  @override
  _HealthTestState createState() => _HealthTestState();
}

class _HealthTestState extends State<HealthTest> {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //TextEditingController healthcontroller = TextEditingController(); 
  TextEditingController runcontroller = TextEditingController();
  TextEditingController swimcontroller = TextEditingController();
  TextEditingController hikingcontroller = TextEditingController();
  TextEditingController cyclecontroller = TextEditingController();

  TextEditingController brocontroller = TextEditingController();
  TextEditingController salcontroller = TextEditingController(); 
  TextEditingController garcontroller = TextEditingController(); 
  TextEditingController nutcontroller = TextEditingController();  
  

  TextEditingController cobbacocontroller = TextEditingController(); 
  //TextEditingController decisoncontroller = TextEditingController(); 
  

  late var switchValue_run;
  late var switchValue_swim;
  late var switchValue_hike;
  late var switchValue_cycle;

  late var switchValue_broccoli;
  late var switchValue_salmon;
  late var switchValue_galic;
  late var switchValue_nuts;

  late var switchValue_cobbaco1;
  late var switchValue_cobbaco2;
  late var switchValue_cobbaco3;
  late var switchValue_cobbaco4;

  //late String formattedDate;
  late var select;
  // 데이터 베이스에 저장될 변수 
  // 운동 
  List<TodoList> todoList= [];
  


  // late List health; // health text 저장 변수
  //late String health_time; // 운동시간
  // late List food;v
  // late List food_amount;
  // late String tabaco; // 담배 저장 
  // late String tabaco_amount; //담배량

  // 저장 시간
  late String formattedDate;
  // health
  String runhealth = '';
  String swimhealth = '';
  String hikehealth = '';
  String cycclehealth = '';
  // 운동시간
  String health_time = ''; 
  // food
  String brofood= '';
  String salfood = '';
  String galfood = '';
  String nutfood = '';
  // foodamount
  String broamount= '';
  String salamount = '';
  String galamount = '';
  String nutamount = '';
  
  // cigarret
  // String nociga = '';
  // String ciga = '';
  // String halfciga = '';
  // String oneciga = '';
  String tabaco = '';

  // cigarret amount
  String tabacoamount = '';
  


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchValue_run = false;
    switchValue_swim = false;
    switchValue_hike = false;
    switchValue_cycle = false;

    switchValue_broccoli = false;
    switchValue_salmon = false;
    switchValue_galic = false;
    switchValue_nuts = false;

    switchValue_cobbaco1 = false;
    switchValue_cobbaco2 = false;
    switchValue_cobbaco3 = false;
    switchValue_cobbaco4 = false;

    DateTime select = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(select);  
    // 저장 변수
    //health =['Running','Swimming','Hiking','Cycling'];
    // health = [];
    // health_time = ''; 
    //food =['Broccoli','Salmon','Galic','Nuts']; 
    // food =[];
    // food_amount=[];
    // tabaco = ''; 
    // tabaco_amount = '';


   
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}