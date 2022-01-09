import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/health.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/listview.dart';
import 'package:mvvm_pattern_app/view/tabbarview/healthpage/listview_provider.dart';
import 'package:mvvm_pattern_app/view/tabbarview/homepage/home.dart';
import 'package:mvvm_pattern_app/view/tabbarview/newspage/news.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/predict.dart';



class TabbarNavigator extends StatefulWidget {
  const TabbarNavigator({ Key? key }) : super(key: key);

  @override
  _TabbarNavigatorState createState() => _TabbarNavigatorState();
}

class _TabbarNavigatorState extends State<TabbarNavigator> {
 var index = 0;
  var pages = const [
    HomePage(), NewsPage(), PredictPage(), ListProvider()
    //Listview()
  ];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H e a r t S p r i t",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blueGrey,
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
        onTap: (value){
          setState(() {
            index = value;
          });
        },
        items: const <BottomNavigationBarItem>[

          //Home
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
          ),
          
          //News
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_quote,
            ),
            label: 'News',
            backgroundColor: Colors.blueGrey,
          ),

          // Predict
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Predict',
            backgroundColor: Colors.blueGrey,
          ),
          //Health
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_run_outlined,
            ),
            label: 'Health',
            backgroundColor: Colors.blueGrey,
          ),
        ],
        currentIndex: index,
      ),
    );
  }
}