import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/predict5.dart';

class Questionpage4 extends StatefulWidget {
  const Questionpage4({Key? key}) : super(key: key);

  @override
  _Questionpage4State createState() => _Questionpage4State();
}

enum result { tr, fa }

class _Questionpage4State extends State<Questionpage4> {
  result? _HvyAlcoholConsump = result.tr;
  result? _NoDocbcCost = result.tr;
  result? _DiffWalk = result.tr;

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
                  '평균 한주간 남성 14잔 여성 7잔 이상의 술을 마십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _HvyAlcoholConsump,
                  onChanged: (result? value) {
                    setState(() {
                      _HvyAlcoholConsump = value;
                      Message.HvyAlcoholConsump = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _HvyAlcoholConsump,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _HvyAlcoholConsump = value;
                        Message.HvyAlcoholConsump = "0";
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
                  '지난 1년간 비용문제로 병원을 못간적이 있으십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _NoDocbcCost,
                  onChanged: (result? value) {
                    setState(() {
                      _NoDocbcCost = value;
                      Message.NoDocbcCost = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _NoDocbcCost,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _NoDocbcCost = value;
                        Message.NoDocbcCost = "0";
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
                  '평소 계단을 이용하는데 불편함을 느끼십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _DiffWalk,
                  onChanged: (result? value) {
                    setState(() {
                      _DiffWalk = value;
                      Message.DiffWalk = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _DiffWalk,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _DiffWalk = value;
                        Message.DiffWalk = "0";
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
                          builder: (context) => const Questionpage5()));
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
