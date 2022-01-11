import 'package:flutter/material.dart';
import 'package:heart_disease_app/views/tabbarview/news.dart';
import 'package:heart_disease_app/views/tabbarview/pred.dart';
import 'package:heart_disease_app/views/tabbarview/pred_result.dart';

class TabbarNavigator extends StatefulWidget {
  const TabbarNavigator({ Key? key }) : super(key: key);

  @override
  _TabbarNavigatorState createState() => _TabbarNavigatorState();
}

class _TabbarNavigatorState extends State<TabbarNavigator> {
 var index = 0;
  var pages = const [
    NewsAPI(),PredictHeart(), PredResult()
    //Listview()
  ];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logo.png',
        ),
        backgroundColor: Colors.white,
      ),
            drawer: Drawer(
        //리스트뷰로 인하여 여러 개 넣을 수가 있다. 
        
        child: ListView(
          
          children: [
            
            //가장 좌측에 보이는 피카츄
            UserAccountsDrawerHeader(

              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/draweruser.png'),
                  radius: 120,
                ),
              ),
              
              
              accountName: const Text('User',
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               ),
              ), 
              accountEmail: const Text('pikachu@naver.com'),
              // header 부분 꾸미기 
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),

            ),
           
            // header 부분 제외한 부분 꾸미기 
            ListTile(
              leading:  const Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap:(){
                //---------
              },
            ),

            ListTile(
              leading:  const Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: const Text('로그아웃'),
              onTap:(){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const TabbarNavigator();
                  }));
                
               
              },
            ),

          ],
        ),
      ),

      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,                    // label을 안 적으면 Error => 이거 적으면 공백으로 적을 수 있다.
        backgroundColor: Color(0xff85B6FF),
        onTap: (value){
          setState(() {
            index = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          
          //News
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),

          // Predict
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
            backgroundColor: Colors.blueGrey,
          ),
          // PredictResult
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart,
              color: Colors.white,
            ),
            label: '',  
            backgroundColor: Colors.blueGrey,
          ),
        ],
        currentIndex: index,
      ),
    );
  }
}