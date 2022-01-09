import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/predict3.dart';

class Questionpage2 extends StatefulWidget {
  const Questionpage2({Key? key}) : super(key: key);

  @override
  _Questionpage2State createState() => _Questionpage2State();
}

enum result { tr, fa }

class _Questionpage2State extends State<Questionpage2> {
  result? _HighBP = result.tr;
  result? _HighCOL = result.tr;
  result? _COLCheck = result.tr;
  result? _SMOKE = result.tr;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  '병원으로부터 고혈압 판정을 받은적이 있으십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _HighBP,
                  onChanged: (result? value) {
                    setState(() {
                      _HighBP = value;
                      Message.HighBP = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _HighBP,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _HighBP = value;
                        Message.HighBP = "0";
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '의사 혹은 병원으로부터 혈중 콜레스테롤 수치가 ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '높다는 판정을 받은적이 있으십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _HighCOL,
                  onChanged: (result? value) {
                    setState(() {
                      _HighCOL = value;
                      Message.HighChol = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _HighCOL,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _HighCOL = value;
                        Message.HighChol = "0";
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '최근 5년간 콜레스테롤 검사를 받으신적이 있으십니까? ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _COLCheck,
                  onChanged: (result? value) {
                    setState(() {
                      _COLCheck = value;
                      Message.CholCheck = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _COLCheck,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _COLCheck = value;
                        Message.CholCheck = "0";
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '평생 피신 담배의 갯수가 100개비 이상입니까?? ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _SMOKE,
                  onChanged: (result? value) {
                    setState(() {
                      _SMOKE = value;
                      Message.Smoker = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _SMOKE,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _SMOKE = value;
                        Message.Smoker = "0";
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Questionpage3()));
                },
                child: const Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
