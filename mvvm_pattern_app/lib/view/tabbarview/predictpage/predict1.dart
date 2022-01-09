import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/predict2.dart';


class Questionpage1 extends StatefulWidget {
  const Questionpage1({Key? key}) : super(key: key);

  @override
  _Questionpage1State createState() => _Questionpage1State();
}

enum Gender { man, woman }

class _Questionpage1State extends State<Questionpage1> {
  Gender? _gender = Gender.man;
  TextEditingController he = TextEditingController();
  TextEditingController kg = TextEditingController();
  TextEditingController MentHlth = TextEditingController();
  TextEditingController DiffWalk = TextEditingController();
  String calcResult = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  '성별',
                  style: TextStyle(fontSize: 30),
                ),
                ListTile(
                  title: const Text('남자'),
                  leading: Radio(
                    value: Gender.man,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      Message.Sex = "1";
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('여자'),
                  leading: Radio(
                    value: Gender.woman,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      Message.Sex = '0';
                      setState(
                        () {
                          _gender = value;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'BMI(체질량 지수)',
                  style: TextStyle(fontSize: 30),
                ),
                TextField(
                  controller: he,
                  decoration: const InputDecoration(labelText: '신장을 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: kg,
                  decoration: const InputDecoration(labelText: '체중을 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  ), // foreground ,
                  onPressed: () {
                    calcFuntion();
                  },
                  child: const Text('BMI계산'),
                ),
                Text(
                  calcResult,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '건강 정보',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "최근 30일 동안 정신적(우울,스트레스) 불편함을 느낀 일수가 몇일정도 되는지 입력해주세요",
                  style: TextStyle(fontSize: 10),
                ),
                TextField(
                  controller: MentHlth,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "최근 30일 동안 신체적(질병,부상) 불편함을 느낀 일수가 몇일정도 되는지 입력해주세요",
                  style: TextStyle(fontSize: 10),
                ),
                TextField(
                  controller: DiffWalk,
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    nextFuntion();
                  },
                  child: const Text('다음'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calcFuntion() {
    if (he.text.isEmpty || kg.text.isEmpty) {
      errorSnackbar(context);
    } else {
      double doublekg = double.parse(kg.text);
      double doublehe = double.parse(he.text) / 100;
      double bmi =
          double.parse((doublekg / (doublehe * doublehe)).toStringAsFixed(2));
      setState(() {
        String resultStr;
        if (bmi <= 18.4) {
          resultStr = '저체중';
        } else if (bmi >= 18.55 && bmi <= 22.9) {
          resultStr = "정상체중";
        } else if (bmi >= 23 && bmi <= 24.9) {
          resultStr = '과체중';
        } else if (bmi >= 25 && bmi <= 29.9) {
          resultStr = '비만';
        } else {
          resultStr = '고도비만';
        }

        calcResult = '귀하의 bmi 지수는 $bmi 이고 $resultStr 입니다.';

        Message.BMI = bmi;
      });
    }
  }

  nextFuntion() {
    if (MentHlth.text.isEmpty || DiffWalk.text.isEmpty) {
      errorSnackbar(context);
    } else {
      Message.MentHlth = MentHlth.text;
      Message.DiffWalk = DiffWalk.text;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Questionpage2()));
    }
  }

  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
