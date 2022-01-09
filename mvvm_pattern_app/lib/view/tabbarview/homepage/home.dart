import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/homepage/heartfood.dart';
import 'package:mvvm_pattern_app/view/tabbarview/homepage/hearthealth.dart';
import 'package:mvvm_pattern_app/view/tabbarview/tabbarnavigator.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int temp = 0;
  int count = 0 ;
  String result = '다음';

  // 심장질환 발생 종류 
  List heartdis = [
    '허혈성 심질환',
    '협심증',
    '심근경색',
    '부정맥'
  ];
  List heartdis_info = [
    '관상동맥에 혈액이 제대로 흐르지 않아 심장근육에 필요한 산소와 영양소가 충분히 전달되지 못하는 질환',
    '혈류 이상으로 근육이 산소와 영양소를 필요로 한 만큼 받지 못할 때 질환',
    '관상동맥에 혈전이 생기거나 경화반 파열등으로 혈류가 막혀 심장근육이 괴사하는 질환(돌연사의 주요 원인)',
    '정상맥박이 아닌 모든 심장 박동 심장율동 등을 포함하는 질환'
  ];

  // 심징질환 발생원인 
  List hearthappen = [
    '심한 우울증', 
    '격한 분노',
    '과도한 폭식',
    '과음'
  ];
  List hearthappen_info =[
    '심각한 불안 증세는 심장마비 위험을 증가시킬 수 있다. 심한 불안 증세는 심장 박동 수와 혈압을 증가시키고, 혈관을 경직시키는 한편 혈액의 응고를 촉진시켜 심장마비의 위험 역시 높일 수 있다.',
    '호주에서 진행한 연구에 따르면, 격렬한 분노를 쏟아내고 2시간 뒤 심장마비가 발생할 확률이 평상시보다 8.5배나 높은 것으로 나타났다. 주먹을 꽉 움켜쥐거나 물건을 집어던지는 행위, 자신이나 남을 다치게 하는 등의 행위는 분노의 강도를 7단계로 나눴을 때 5~6단계 정도에 속하는 격렬한 분노 표출 행위다.',
    '미국에서 진행된 연구에 따르면, 심장 질환 위험에 처한 사람들이 폭식을 한 뒤 2시간이 지나면 심장마비가 발생할 가능성이 4배 가량 높아지는 것으로 조사됐다.폭식은 여러가지 방법으로 심장마비 발생 위험을 높일 수 있다. 음식을 먹는 행동만으로도 심장 박동 수와 혈압이 증가하고, 음식에서 나온 지방산 등이 혈류 속으로 들어가 심장 동맥을 수축시키기 때문이다.',
    '알코올을 과도하게 섭취하면 중성지방이 증가하고 혈압이 상승해 심장병과 돌연 심장사 위험 역시 올라간다.'
  ];

  // 심장질환 꿀팁 
  List hearttip =[
   '담배를 피우지 않는다',
   '음주는 하루에 한,두잔 이하로 줄인다.',
   '음식은 싱겁게 골고루 채소와 생선을 충분히 섭취한다.',
   '가능한 매일 30분 이상 적절한 운동은 한다.',
   '적정 체중과 허리둘레를 유지한다.',
   '스트레스를 줄이고 즐거운 마음으로 생활한다.'
  ];
  List hearttip_info = [
    '흡연자의 경우 비흡연자의 비해 2배이며 금연 후 1년이 지나면 심혈관 질환의 위험성이 절반으로 감소하므로 담배를 피우지 않는 것이 좋습니다.',
    '한 두잔의 술은 혈관을 좁아지거나 막혀서 생기는 허혈성 심혈관 질환예방에는 좋지만 과도한 음주는 부정맥과 심근경색증을 유발하는 원인입니다.',
    '음식을 짜게 먹는 습관은 혈압을 높여 심혈관 질환이 악화되기 쉬우므로 싱겁게 먹어야 하며 섬유소과 많은 식품은 혈중 콜레스테롤을 적정 수준으로 유지하며 등푸른 생선은 혈중 중성지방을 낮추고 혈전 형성을 예방 할 수 있습니다.',
    '적절한 신체 활동은 혈압과 혈당은 낮추고 체중을 감소시켜 심혈관 질환 관련 사망 위험을 감소시킵니다. 유산소 운동 추천!',
    '비만은 고혈압, 당뇨병, 이상지질혈증의 위험을 증가시키고 심혈관 질환의 발생률이 높아지므로 체중조절을 해야합니다.',
    '스트레스는 혈압을 상승시키고 부정맥을 유발하며 동맥경화를 촉진합니다. 즐겁고 긍정적인 마음가짐으로 생활해야 합니다.'
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Drawer 
    
      drawer: Drawer(
        //리스트뷰로 인하여 여러 개 넣을 수가 있다. 
        
        child: ListView(
          
          children: [
            
            //가장 좌측에 보이는 피카츄
            UserAccountsDrawerHeader(
              
              accountName: const Text('Pikachu',
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
                Icons.manage_accounts_outlined,
                color: Colors.black,
              ),
              title: const Text('회원정보수정'),
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
                //---------
              },
            ),

            ListTile(
              leading:  const Icon(
                Icons.person_off_outlined,
                color: Colors.red,
              ),
              title: const Text('회원탈퇴'),
              onTap:(){
                //---------
              },
            ),
          ],
        ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:  [

            // 심장질환 질병 종류 
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink), 
                shape: MaterialStateProperty.all(RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(30),),),
                fixedSize: MaterialStateProperty.all(const Size(420, 100)),
              ),
              onPressed: (){
                 //_showDialog(context);
                 print(count);
                  count = 0;
                  _heartspeices_showDialog(context);
                
                 
              },
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text('심장질환 종류',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text('도대체 가슴이 아픈건데 왜이리 심장질병에 관한 종류가 많아!!'),
                  Text('심장질환 종류에 대해 알아보자!')
                ],
              ),
            ),


            // 심장질환 발생원인 
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red), 
                shape: MaterialStateProperty.all(RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(30),),),
                fixedSize: MaterialStateProperty.all(const Size(420, 100)),
              ),
              onPressed: (){
                  //count < 4 ? showDialog : Endpop();
                  count = 0;
                  
                   _hearthappen_showDialog(context);
                // _dialog
              }, 
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text('심장질환 발생원인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text('무심코 있다가 발생하는 심장질환!'),
                  Text('무엇때문에 나의 심장을 나쁘게 하는지 알아보자!')
                ],
              ),
            ),




            // 심장 tip 화면
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange), 
                shape: MaterialStateProperty.all(RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(30),),),
                fixedSize: MaterialStateProperty.all(const Size(420, 100)),
              ),
              onPressed: (){
                  count = 0;
                  _hearttip_showDialog(context);
                // _dialog
              }, 
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text('심장건강을 위한 6가지 꿀팁',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text('언제, 어디서, 어떻게 소리없이 찾아오는 심장질환!'),
                  Text('사전에 미리미리 유용한 정보를 알고 예방하자!')
                ],
              ),
            ),

            // 심장질환 에방운동
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue), 
                shape: MaterialStateProperty.all(RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(30),),),
                fixedSize: MaterialStateProperty.all(const Size(420, 100)),
              ),
              onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const ViewHeartHealth();
                }));
                
              }, 
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text('심장질환 예방운동',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text('가만히 있다가 진짜 심장질환 걸리는거 아니야?'),
                  Text('심장질환에 좋은 운동법에 대해 알아보자!')
                ],
              ),
            ),

             // 심장질환 음식 레시피
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green), 
                shape: MaterialStateProperty.all(RoundedRectangleBorder
                  (borderRadius: BorderRadius.circular(30),),),
                fixedSize: MaterialStateProperty.all(const Size(420, 100)),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const HeartFood();
                }));
                // _dialog
              }, 
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text('심장에 좋은 음식레시피',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text('심장질환 예방할려면 맨날 맛없는 채소랑 야채만 먹는거 아니야?'),
                  Text('심장에 좋은 식단 레시피에 대해 알아보자 !')
                ],
              ),
            ),

           
           
          ],
        ),
      ),
    );
  }
    // int heartspecies_count = 0;
  // int hearthappen_count = 0; 
  // int hearttip_count = 0;


// 심장질환 종류 
   _heartspeices_showDialog(BuildContext context)
    { 
      //int temp = 0;
      //temp ++;
     
      print(temp);
      showDialog(
        context: context, 
        builder: (BuildContext context){
        // alterdialog() == 팝업 
        return AlertDialog(
          //count < 4 ? _heartspeices_showDialog(context) : Navigator.of(context).pop();
          title: Text('${heartdis[count]}'),
          content: Text('${heartdis_info[count]}'),
          actions:[
            ElevatedButton(
              onPressed: (){
                // 삼항 연산자
                //value2 = value ? 100 : 200;  
                setState(() {
                  count++;
                  print(count);
                  Navigator.of(context).pop();
                   count == 4 ? Endpop() : _heartspeices_showDialog(context); 
                  
                });
                },
              child: Text('${result}'),
              ),
          ],
        );
        }
      );
    }  

    // 심장질환 발생원인
   _hearthappen_showDialog(BuildContext context)
    {
      temp++;
      showDialog(

        context: context, 
        builder: (BuildContext context){
        // alterdialog() == 팝업 
        return AlertDialog(
          title: Text('${hearthappen[count]}'),
          content: Text('${hearthappen_info[count]}'),
          actions:[
            ElevatedButton(
              onPressed: (){
                setState(() {

                  count++;
                  Navigator.of(context).pop();
                   count == 4 ? Endpop() : _hearthappen_showDialog(context);


                  });
                },
              child: Text('${result}'),
              ),
          ],
        );
        },
      );
    }


    // 심장질환 꿀팁
   _hearttip_showDialog(BuildContext context)
    {
     
      showDialog(
        context: context, 
        builder: (BuildContext context){
        // alterdialog() == 팝업 
        return AlertDialog(
          title: Text('${hearttip[count]}'),
          content: Text('${hearttip_info[count]}'),
          actions:[
            ElevatedButton(
              onPressed: (){
                setState(() {
                  count++;
                  Navigator.of(context).pop();
                   count == 6 ? Endpop() : _hearttip_showDialog(context);
                });
                },
              child: Text('${result}'),
              ),
          ],
        );
        }
      );
    } 

    // 종료 
    void Endpop(){
       Navigator.of(context).pop();
       Navigator.push(context, MaterialPageRoute(builder: (context){
      return const TabbarNavigator();
      }));

    }

}