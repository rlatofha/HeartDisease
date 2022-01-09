import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/message.dart';
import 'package:mvvm_pattern_app/view/tabbarview/predictpage/predict4.dart';

class Questionpage3 extends StatefulWidget {
  const Questionpage3({Key? key}) : super(key: key);

  @override
  _Questionpage3State createState() => _Questionpage3State();
}

enum result { tr, fa }

class _Questionpage3State extends State<Questionpage3> {
  result? _Stroke = result.tr;
  result? _PhysActivity = result.tr;
  result? _Fruits = result.tr;
  result? _Veggies = result.tr;
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
                  '뇌졸중으로 쓰러진 적이 있으십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _Stroke,
                  onChanged: (result? value) {
                    setState(() {
                      _Stroke = value;
                      Message.Stroke = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _Stroke,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _Stroke = value;
                        Message.Stroke = "0";
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
                  '매달 주기적으로 운동을 하십니까?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _PhysActivity,
                  onChanged: (result? value) {
                    setState(() {
                      _PhysActivity = value;
                      Message.PhysActivity = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _PhysActivity,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _PhysActivity = value;
                        Message.PhysActivity = "0";
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '하루에 한 번 이상 과일를 섭취하시나요? ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _Fruits,
                  onChanged: (result? value) {
                    setState(() {
                      _Fruits = value;
                      Message.Fruits = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _Fruits,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _Fruits = value;
                        Message.Fruits = "0";
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '하루에 한 번 이상 야채를 섭취하시나요?? ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                title: const Text('YES'),
                leading: Radio(
                  value: result.tr,
                  groupValue: _Veggies,
                  onChanged: (result? value) {
                    setState(() {
                      _Veggies = value;
                      Message.Veggies = "1";
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('NO'),
                leading: Radio(
                  value: result.fa,
                  groupValue: _Veggies,
                  onChanged: (result? value) {
                    setState(
                      () {
                        _Veggies = value;
                        Message.Veggies = "0";
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
                          builder: (context) => const Questionpage4()));
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
