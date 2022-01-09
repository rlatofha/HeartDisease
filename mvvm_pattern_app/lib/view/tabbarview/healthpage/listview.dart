import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/model/todo_list.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/count_up_time.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/health.dart';

class Listview extends StatefulWidget {
  const Listview({ Key? key }) : super(key: key);

  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List<TodoList> todoList=[];

  // 저장 시간
  late String date;
  // health
  late String runhealth;
  late String swimhealth;
  late String hikehealth ;
  late String cycclehealth;
  // 운동시간
  late String health_time; 
  // food
  late String brofood;
  late String salfood ;
  late String galfood ;
  late String nutfood ;
  // foodamount
  late String broamount;
  late String salamount;
  late String galamount;
  late String nutamount;
  
  // cigarret
  
  late String tabaco;

  // cigarret amount
  late String tabaco_amount;
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 저장 시간
  date ='';
  // health
  runhealth = '';
  swimhealth = '';
  hikehealth = '';
  cycclehealth = '';
  // 운동시간
  health_time = ''; 
  // food
  brofood= '';
   salfood = '';
  galfood = '';
  nutfood = '';
  // foodamount
  broamount= '';
  salamount = '';
  galamount = '';
  nutamount = '';

  tabaco = '';

  tabaco_amount = '';

  }
 
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('운동 Scheduler'),
        actions: [
          // 타이머 버튼
          IconButton(
           onPressed: (){
                  //Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Count_up_timer();
                  }));
                },
            icon: const Icon(Icons.add_alarm_outlined)
          ),
          // 운동스케줄 추가 
          IconButton(
              onPressed: (){
                  //Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Health();
                  }));
                },
            icon: const Icon(Icons.add_outlined)
          ),
           // 운동스케줄 검색 
          IconButton(
              onPressed: (){
                 _Read();
                },
            icon: const Icon(Icons.search_outlined)
          ),
        ],
      ),
      
     body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          // position 배열 번지 수 
          itemBuilder: (context,position){
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                child: SizedBox(
                  height: 160,
                  child: Card(
                    color: Colors.red[200],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Text('날짜: '),
                              Text('${todoList[position].date}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                          child: Row(
                            children: [
                              const Text('운동: ',
                              style: TextStyle(
                                
                              ),
                              ),
                              Text('${todoList[position].runhealth} ${todoList[position].swimhealth} ${todoList[position].hikehealth} ${todoList[position].cycclehealth}')
                            ],
                          ),
                        ),

   
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                          child: Row(
                            children: [
                              const Text('운동시간: '),
                              Text('${todoList[position].health_time}min')
                            ],
                          ),
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                          child: Row(
                            children: [
                              const Text('음식: '), 
                              Text('${todoList[position].brofood} ${todoList[position].salfood} ${todoList[position].galfood} ${todoList[position].nutfood}')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                          child: Row(
                            children: [
                              const Text('음식량:'),
                              Text('${todoList[position].broamount}g / ${todoList[position].salamount}g / ${todoList[position].galamount}g / ${todoList[position].nutamount}g')
                            ],
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                          child: Row(
                            children: [
                              const Text('담배: '),
                              Text('${todoList[position].tabaco}')
                            ],
                          ),
                        ),
                        
                         Padding(
                           padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                           child: Row(
                             children: [
                               const Text('담배량: '),
                               Text('${todoList[position].tabaco_amount}')
                             ],
                           ),
                         ), 
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  _showDeleteDialog(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _Read() async {
      
      DocumentSnapshot data = await firestore.collection('Health').doc('user2').get(); // firebase 조회 할 컬럼 추출
      setState(() {
        date = data['date'];

        runhealth=data['runhealth'];
        swimhealth= data['swimhealth'];
        hikehealth = data['hikehealth'];
        cycclehealth = data['cycclehealth'];
        health_time = data['health_time'];

        brofood= data['brofood'];
        salfood=data['salfood'];
        galfood=data ['garfood'];
        nutfood=data['nutfood'];

        broamount=data['broamount'];
        salamount=data['salamount'];
        galamount=data['garamount'];
        nutamount=data['nutamount'];

        tabaco=data['tabaco'];
        tabaco_amount = data['tabaco_amount'];

      }); 
       
       todoList.add(TodoList(date: date, runhealth: runhealth, swimhealth: swimhealth, hikehealth: hikehealth, cycclehealth: cycclehealth,health_time: health_time,brofood: brofood,salfood:salfood,galfood: galfood,nutfood:nutfood,broamount: broamount,salamount: salamount,galamount: galamount,nutamount: nutamount,tabaco: tabaco,tabaco_amount: tabaco_amount));
    }






  // user id 삽입 부분

  // void _Read() async { // String id insert 
  //     var data;
  //     var idch; 
  //     var pwch;
  //     var id = 'user2';

  //     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance 
  //     .collection('Health')
  //     .where('id', isEqualTo: id)
  //     .get();

  //     List<QueryDocumentSnapshot> docs = snapshot.docs;
  //     for (var doc in docs) {
  //     if (doc.data() != null) {
  //     data = doc.data() as Map<String, dynamic>;
  //       //id = data['id']; 

  //       date = data['date'];

  //       runhealth=data['runhealth'];
  //       swimhealth= data['swimhealth'];
  //       hikehealth = data['hikehealth'];
  //       cycclehealth = data['cycclehealth'];
  //       health_time = data['health_time'];

  //       brofood= data['brofood'];
  //       salfood=data['salfood'];
  //       galfood=data ['garfood'];
  //       nutfood=data['nutfood'];

  //       broamount=data['broamount'];
  //       salamount=data['salamount'];
  //       galamount=data['garamount'];
  //       nutamount=data['nutamount'];

  //       tabaco=data['tabaco'];
  //       tabaco_amount = data['tabaco_amount'];
        
  //     }
  //     todoList.add(TodoList(date: date, runhealth: runhealth, swimhealth: swimhealth, hikehealth: hikehealth, cycclehealth: cycclehealth,health_time: health_time,brofood: brofood,salfood:salfood,galfood: galfood,nutfood:nutfood,broamount: broamount,salamount: salamount,galamount: galamount,nutamount: nutamount,tabaco: tabaco,tabaco_amount: tabaco_amount));
  //   }
  // }
    
    


    _showDeleteDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('운동스케줄'),
            content: const Text('해당 스케줄을 삭제하겠습니까?'),
            actions:[
              TextButton(
                onPressed: (){
                 
                  _Delete();
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Listview();
                  }));

                },
                child: const Text('확인'),
              ),
            ],
          );
        }
      );
    }

    void _Delete() async {
    firestore.collection('Health').doc().delete(); // firebase 조회 할 컬럼 추출
    }
  }

