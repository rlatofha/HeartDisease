import 'package:flutter/material.dart';

class PredResult extends StatefulWidget {
  const PredResult({ Key? key }) : super(key: key);

  @override
  _PredResultState createState() => _PredResultState();
}

class _PredResultState extends State<PredResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('예측결과보기'),
      )
      
    );
  }
}