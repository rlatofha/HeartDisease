import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/predict.dart';
import 'package:mvvm_pattern_app/view/tabbarview/tabbarnavigator.dart'; // 미리 적어주기

class Questionpage5 extends StatefulWidget {
  const Questionpage5({Key? key}) : super(key: key);

  @override
  _Questionpage5State createState() => _Questionpage5State();
}

enum result { vn, n, m, y, vy }
String result2 = '';

class _Questionpage5State extends State<Questionpage5> {
  result? _Diabetes = result.m;
  result? _GenHlth = result.m;

  String HeartDiseaseorAttack = "all";
  String ans = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                '현재 당뇨병에 걸리셨습니까? ',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              title: const Text('환자'),
              leading: Radio(
                value: result.m,
                groupValue: _Diabetes,
                onChanged: (result? value) {
                  setState(() {
                    _Diabetes = value;
                    Message.Diabetes = "2";
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('의심'),
              leading: Radio(
                value: result.n,
                groupValue: _Diabetes,
                onChanged: (result? value) {
                  setState(() {
                    _Diabetes = value;
                    Message.Diabetes = "1";
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('아니다'),
              leading: Radio(
                value: result.vn,
                groupValue: _Diabetes,
                onChanged: (result? value) {
                  setState(() {
                    _Diabetes = value;
                    Message.Diabetes = "0";
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                '당신의 컨디션은 ?',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              title: const Text('매우 좋다'),
              leading: Radio(
                value: result.vy,
                groupValue: _GenHlth,
                onChanged: (result? value) {
                  setState(
                    () {
                      _GenHlth = value;
                      Message.GenHlth = "5";
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: const Text('좋다'),
              leading: Radio(
                value: result.y,
                groupValue: _GenHlth,
                onChanged: (result? value) {
                  setState(() {
                    _GenHlth = value;
                    Message.GenHlth = "4";
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('보통이다'),
              leading: Radio(
                value: result.m,
                groupValue: _GenHlth,
                onChanged: (result? value) {
                  setState(() {
                    _GenHlth = value;
                    Message.GenHlth = "3";
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('나쁘다'),
              leading: Radio(
                value: result.n,
                groupValue: _GenHlth,
                onChanged: (result? value) {
                  setState(() {
                    _GenHlth = value;
                    Message.GenHlth = "2";
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('매우 나쁘다'),
              leading: Radio(
                value: result.vn,
                groupValue: _GenHlth,
                onChanged: (result? value) {
                  setState(() {
                    _GenHlth = value;
                    Message.GenHlth = "1";
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey));
                getJSONData();
              },
              child: const Text('입력'),
            ),
          ],
        ),
      ),
    );
  }

  getJSONData() async {
    String CholCheck = Message.CholCheck;
    String Diabetes = Message.Diabetes;
    String DiffWalk = Message.DiffWalk;
    String Fruits = Message.Fruits;
    String GenHlth = Message.GenHlth;
    String HighBP = Message.HighBP;
    String HighChol = Message.HighChol;
    String HvyAlcoholConsump = Message.HvyAlcoholConsump;
    String MentHlth = Message.MentHlth;
    String NoDocbcCost = Message.NoDocbcCost;
    String PhysActivity = Message.PhysActivity;
    String PhysHlth = Message.PhysHlth;
    String Sex = Message.Sex;
    String Smoker = Message.Smoker;
    String Stroke = Message.Stroke;
    String Veggies = Message.Veggies;
    String BMI = Message.BMI.toString();

    var url = Uri.parse(
        'http://localhost:8080/Flutter/heart.jsp?CholCheck=$CholCheck&Diabetes=$Diabetes&DiffWalk=$DiffWalk&Fruits=$Fruits&GenHlth=$GenHlth&HighBP=$HighBP&HighChol=$HighChol&HvyAlcoholConsump=$HvyAlcoholConsump&MentHlth=$MentHlth&NoDocbcCost=$NoDocbcCost&PhysActivity=$PhysActivity&PhysHlth=$PhysHlth&Sex=$Sex&Smoker=$Smoker&Stroke=$Stroke&Veggies=$Veggies&BMI=$BMI');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      HeartDiseaseorAttack = dataConvertedJSON['HeartDiseaseorAttack'];
    });
    _showDialog(context, HeartDiseaseorAttack);
    if (HeartDiseaseorAttack == '1') {
      result2 = '위험';
    } else {
      result2 = "안전";
    }
  }

  _showDialog(BuildContext context, String HeartDiseaseorAttack) {
    showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: const Text('자가 진단 결과'),
            content: Text('당신은 심장질환으로 부터 $result2 합니다 .'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const TabbarNavigator()));
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
