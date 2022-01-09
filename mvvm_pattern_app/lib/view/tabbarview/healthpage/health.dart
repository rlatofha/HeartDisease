import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_pattern_app/model/todo_list.dart';
import 'package:mvvm_pattern_app/service/healthdb.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/listview.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/tabbarnavigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Health(),
    );
  }
}



class Health extends StatefulWidget {
  const Health({ Key? key }) : super(key: key);
   

  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
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
   return Scaffold(
      appBar: AppBar(
        title: const Text('건강관리 스케줄'),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                showDatePickerPop();
              });
              
            },
            icon: const Icon(Icons.calendar_today_outlined)
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              ///////// 달력 /////////
              
              
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 10, 60, 10),
                child: Text('날짜 : ' + formattedDate,
                  style: const TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              //////// 달력 //////////
        
              Container(
                color: Colors.blue[200],
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(170, 20, 167, 10),
                  child: Text(
                    'Heath',
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                ),
              ),
        
              // 운동 관련 아이콘 
              Container(
                 color: Colors.blue[200],
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
             // 러닝
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 5, 15, 5),
                  child: Icon(
                    Icons.directions_run_outlined,
                    size: 60,
                  ),
                ),
             // 수영 
             Padding(
                 padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                 child: Icon(
                    Icons.pool_outlined,
                    size: 60,
                  ),
             ),
                // 등산 
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                  child: Icon(
                    Icons.hiking_outlined,
                    size: 60,
                  ),
                ),
                // 자전거 
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Icon(
                    Icons.directions_bike_outlined,
                    size: 60,
                  ),
                ),
                  ],
                ),
              ),
        
              // 운동 이름 설정
              Container(
                 color: Colors.blue[200],
                child: Row(
                  //MainAxisAlignment: MainAxisAlignment.center,
                  children: const [
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(60, 5, 10, 5),
                      child: Text(
                        'Running',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        'Swimming',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding:EdgeInsets.fromLTRB(15, 5, 10, 5),
                      child: Text(
                        'Hiking',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      child: Text(
                        'Cycling',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              Container(
                color: Colors.blue[200],
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    // 조깅 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 5, 10, 5),
                      child: Switch(
                        value: switchValue_run, 
                        onChanged: (value){
                          setState(() {
                            switchValue_run=value;
                            if(switchValue_run==true){
                              //health.add('Running');
                              runhealth = 'Running';
                            }else{
                              runhealth = '';
                              //
                            }
                          });
                        } 
                      ),
                    ),
        
                    // 수영 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                      child: Switch(
                        value: switchValue_swim,
                        onChanged: (value){
                          setState(() {
                            switchValue_swim=value;
                            if(switchValue_swim==true){
                              //todoList.add(TodoList(health: 'Swimming'));
                              //health.add('Swimming');
                              swimhealth = 'Swimming';
                            }else{
                              swimhealth = '';
                              //
                            }
                            
                          });
                        } 
                      ),
                    ),
        
                    // 등산 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 10, 5),
                      child: Switch(
                        value: switchValue_hike, 
                        onChanged: (value){
                          setState(() {
                            switchValue_hike=value;
                             if(switchValue_hike==true){
                               //todoList.add(TodoList(health: 'Hiking'));
                              //health.add('Hiking');
                              hikehealth = 'Hiking';
                            }else{
                              hikehealth = '';
                              //
                            }
                          });
                        } 
                      ),
                    ),
        
                    // 자전거 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                      child: Switch(
                        value: switchValue_cycle,
                        onChanged: (value){
                          setState(() {
                            switchValue_cycle=value;
                            if(switchValue_cycle==true){
                              //health.add('Cycling');
                              //health.add('Cycling');
                              cycclehealth = 'Cycling';
                            }else{
                              cycclehealth = '';
                              //
                            }
                            
                          });
                        } 
                      ),
                    ),
                  ],
                ),
              ),
        
              
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    //color:  Colors.amber,
                    width: 300,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                        controller: runcontroller,
                        decoration: const InputDecoration(
                        labelText: '운동시간(분)',
                          hintText: '/30min'
                        ),
                        keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                // Container(
                //   width: 70,
                //   child: TextField(
                //     style: const TextStyle(
                //       fontSize: 12,
                //     ),
                //       controller: swimcontroller,
                //       decoration: const InputDecoration(
                //       labelText: '운동시간(분)',
                //         hintText: '/30min'
                //       ),
                //       keyboardType: TextInputType.text,
                //   ),
                // ),

                // Container(
                //   width: 70,
                //   child: TextField(
                //     style: const TextStyle(
                //       fontSize: 12,
                //     ),
                //       controller: hikingcontroller,
                //       decoration: const InputDecoration(
                //       labelText: '운동시간(분)',
                //         hintText: '/30min'
                //       ),
                //       keyboardType: TextInputType.text,
                //   ),
                // ),

                // Container(
                //   width: 70,
                //   child: TextField(
                //     style: const TextStyle(
                //       fontSize: 12,
                //     ),
                //       controller: cyclecontroller,
                //       decoration: const InputDecoration(
                //       labelText: '운동시간(분)',
                //         hintText: '/30min'
                //       ),
                //       keyboardType: TextInputType.text,
                //   ),
                // ),
                ],
              ),
        
        
              Container(
                color: Colors.amber[200],
                child:  const Padding(
                  padding:  EdgeInsets.fromLTRB(173, 20, 180, 8),
                  child:  Text(
                    'Food',
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                ),
              ),
        
              // 음식 섭취 
              // 브로콜리, 연어, 마늘, 견과류 
              Container(
                color: Colors.amber[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Image.asset('images/health_asset/broccoli_icon.png',
                        width: 70,
                        height: 100,
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Image.asset('images/health_asset/salmon_icon.png',
                      width: 70,
                      height: 100,
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Image.asset('images/health_asset/garlic_icon.png',
                      width: 70,
                      height: 100,
                      ),
                    ),
        
                    Image.asset('images/health_asset/nuts_icon.png',
                    width: 70,
                    height: 100,
                    ),
        
                  ],
                ),
              ),
        
               // 음식 이름 설정
              Container(
                color: Colors.amber[200],
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                      child: Text(
                        'Broccoli',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
                      child: Text(
                        'Salmon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(28, 0, 20, 0),
                      child: Text(
                        'Galic',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 20, 0),
                      child: Text(
                        'Nuts',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 음식 


              Container(
                color: Colors.amber[200],
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    // 브로컬리 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                      child: Switch(
                        value: switchValue_broccoli, 
                        onChanged: (value){
                          setState(() {
                            switchValue_broccoli=value;
                            if(switchValue_broccoli = true){
                              //food.add('Broccoli');
                              brofood = brocontroller.text.toString();
                            }
                          });
                        } 
                      ),
                    ),
        
                    // 연어 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
                      child: Switch(
                        value: switchValue_salmon,
                        onChanged: (value){
                          setState(() {
                            switchValue_salmon=value;
                            if(switchValue_salmon = true){
                              //food.add('Salmon');
                              salfood = salcontroller.text.toString();
                            }
                          });
                        } 
                      ),
                    ),
        
                    // 마늘 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                      child: Switch(
                        value: switchValue_galic, 
                        onChanged: (value){
                          setState(() {
                            switchValue_galic=value;
                            if(switchValue_galic = true){
                              //food.add('Galic');
                              galfood = garcontroller.text.toString();
                            }
                          });
                        } 
                      ),
                    ),
        
                    // 견과류 스위치
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
                      child: Switch(
                        value: switchValue_nuts,
                        onChanged: (value){
                          setState(() {
                            switchValue_nuts=value;
                            if(switchValue_nuts = true){
                              //food.add('Nuts');
                              nutfood = nutcontroller.text.toString();
                            }
                          });
                        } 
                      ),
                    ),
                  ],
                ),
              ),
        
              Container(
                //color: Colors.amber,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,0,20,20),
                      child: Container(
                        width: 60,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                          controller: brocontroller,
                          decoration: const InputDecoration(
                          labelText: '섭취량(G)',
                          hintText: '/60g'
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,20,20),
                      child: Container(
                        width: 60,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                          controller: salcontroller,
                          decoration: const InputDecoration(
                          labelText: '섭취량(G)',
                          hintText: '/85g'
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),




                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,20,20),
                      child: Container(
                        width: 60,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                          controller: garcontroller,
                          decoration: const InputDecoration(
                          labelText: '섭취량(G)',
                          hintText: '/100g'
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,20,20),
                      child: Container(
                        width: 60,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                          controller: nutcontroller,
                          decoration: const InputDecoration(
                          labelText: '섭취량(G)',
                          hintText: '/30g'
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
        
        
             

                // 담배 
                 Container(
                   color: Colors.red[200],
                   child: const Padding(
                     padding:  EdgeInsets.fromLTRB(160, 10, 161, 10),
                     child:  Text(
                      'Tabaco',
                      style: TextStyle(
                        fontSize: 30, 
                        fontWeight: FontWeight.bold, 
                      ),
                      ),
                   ),
                 ),

                Container(
                  color: Colors.red[200],
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 금연
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                        child: Image.asset('images/health_asset/cigarette-butt.png',
                        width: 70,
                        height: 80,
                        ),
                      ),
                      // 개비
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Image.asset('images/health_asset/cigarette_icon.png',
                        width: 70,
                        height: 80,
                        ),
                      ),
                      //반갑
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Image.asset('images/health_asset/cigarette_5pack.png',
                        width: 70,
                        height: 80,
                        ),
                      ),
                      //한갑
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Image.asset('images/health_asset/cigarettes_1pack.png',
                        width: 70,
                        height: 80,
                        ),
                      ),
                    ],
                  ),
                ),



                Container(
                  color: Colors.red[200],
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 0, 31, 0),
                      child: Switch(
                        value: switchValue_cobbaco1, 
                        onChanged: (value){
                          setState(() {
                            switchValue_cobbaco1=value;
                            if(switchValue_cobbaco1 == true){
                              switchValue_cobbaco2 = false;
                              switchValue_cobbaco3 = false;
                              switchValue_cobbaco4 = false;
                              tabaco = 'No Tabaco';
                            }
                          });
                        } 
                      ),
                    ),

                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                       child: Switch(
                        value: switchValue_cobbaco2, 
                        onChanged: (value){
                          setState(() {
                            switchValue_cobbaco2=value;
                            if(switchValue_cobbaco2 == true){
                              switchValue_cobbaco1 = false;
                              switchValue_cobbaco3 = false;
                              switchValue_cobbaco4 = false;
                              tabaco = 'cigarette';
                            }
                          });
                        } 
                    ),
                     ),

                     Switch(
                      value: switchValue_cobbaco3, 
                      onChanged: (value){
                        setState(() {
                          switchValue_cobbaco3=value;
                          if(switchValue_cobbaco3 == true){
                              switchValue_cobbaco1 = false;
                              switchValue_cobbaco2 = false;
                              switchValue_cobbaco4 = false;
                              tabaco = 'Half pack';
                            }
                        });
                      } 
                    ),

                     Padding(
                       padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                       child: Switch(
                        value: switchValue_cobbaco4, 
                        onChanged: (value){
                          setState(() {
                            switchValue_cobbaco4=value;
                            if(switchValue_cobbaco4 == true){
                              switchValue_cobbaco1 = false;
                              switchValue_cobbaco2 = false;
                              switchValue_cobbaco3 = false;
                              tabaco = 'One pack';
                            }
                          });
                        } 
                    ),
                     ),

                    ],
                  ),
                ),

                Container(
                  color: Colors.red[200],
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Padding(
                        padding: EdgeInsets.fromLTRB(45, 0, 20, 0),
                        child: Text(
                          'No Tabaco',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                        child: Text(
                          'cigarette',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                        child: Text(
                          'Half pack',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Text(
                        'One pack',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),



                    ],
                  ),
                ),
                 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.bold
                        ),
                      controller: cobbacocontroller,
                      decoration: const InputDecoration(
                      labelText: '수량(개비/갑)',
                      ),
                      keyboardType: TextInputType.text,
                ),
                    ),

                  ],
                ),
                  

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black)
                      ),
                      onPressed: (){
                      // 값을 저장 데이터 베이스 
                       health_time = runcontroller.text.toString();

                       broamount = brocontroller.text.toString();
                       salamount = salcontroller.text.toString();
                       galamount = garcontroller.text.toString();
                       nutamount = nutcontroller.text.toString();

                       tabacoamount = cobbacocontroller.text.toString();

                      //  food_amount.add(brocontroller.text.toString());
                      //  food_amount.add(salcontroller.text.toString());
                      //  food_amount.add(garcontroller.text.toString());
                      //  food_amount.add(nutcontroller.text.toString());
                      //  tabaco_amount = cobbacocontroller.text.toString();
                      //  _Create(formattedDate, health, health_time,food,food_amount,tabaco,tabaco_amount);
                      _Create(formattedDate, runhealth, swimhealth, hikehealth, cycclehealth,health_time,brofood,salfood,galfood,nutfood,broamount,salamount,galamount,nutamount,tabaco,tabacoamount);

                      }, 
                      child: const Text('저장',
                        style: TextStyle(
                          color: Colors.white,

                        ),
                      )
                    ),
                  ],
                ),
              ),
                
        
        
            ],
          ),
        ),
      ),
    );
  }

    /* DatePicker 띄우기 */
  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2022), //시작일
      lastDate: DateTime(2024), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      
      setState(() {
        select = dateTime;
        formattedDate=DateFormat('yyyy-MM-dd').format(select);  

        //formattedDate= dateTime.toString();
      });
      
      Fluttertoast.showToast(
        msg: dateTime.toString(), // 날짜 지정 값 
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  //void _Create(String formattedDate, health, String health_time, List food, List food_amount, String tabaco, String tabaco_amount) async {
  void _Create(formattedDate, runhealth, swimhealth, hikehealth, cycclehealth,health_time,brofood,salfood,galfood,nutfood,broamount,salamount,galamount,nutamount,tabaco,tabacoamount) async {
    // id 조건문 삽입 
     //firestore.collection('Health').add({ 
       firestore.collection('Health').doc('user3').set({
         
      "date": formattedDate,
      "runhealth": runhealth,
      "swimhealth": swimhealth,
      "hikehealth": hikehealth,
      "cycclehealth": cycclehealth,
      "health_time": health_time,

      "brofood": brofood,
      "salfood": salfood,
      "garfood":galfood,
      "nutfood": nutfood,
      "broamount": broamount,
      "salamount": salamount,
      "garamount": galamount,
      "nutamount": nutamount,
      "tabaco": tabaco,
      "tabaco_amount": tabacoamount,
   

      // "Date": formattedDate,
      // "health": health,
      // "health_time":health_time,
      // "food": food,
      // "food_amount": food_amount,
      // "tabaco": tabaco,
      // "tabaco_amount": tabaco_amount,
      //"gender":gender,
    });
          // print(formattedDate);
          // print(health); 
          // print(health_time);
          // print(food);
          // print(food_amount);
          // print(tabaco); 
          // print(tabaco_amount);
          _showDialog(context);
  }


  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('운동스케줄'),
            content: const Text('운동스케줄 등록이 완료되었습니다.'),
            actions:[
              TextButton(
                onPressed: (){
                 
                  //Message.typeList= todoList[position].typeList;
                  print(Message.id);
                   print(runhealth);
                    print(swimhealth);
                     print(hikehealth);

                  DBHealthService db = DBHealthService();
                  db.insertJSONData(Message.id,formattedDate, runhealth, swimhealth, hikehealth, cycclehealth,health_time,brofood,salfood,galfood,nutfood,broamount,salamount,galamount,nutamount,tabaco,tabacoamount);


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





}








