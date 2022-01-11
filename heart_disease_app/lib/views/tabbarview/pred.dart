import 'package:flutter/material.dart';

class PredictHeart extends StatefulWidget {
  const PredictHeart({ Key? key }) : super(key: key);

  @override
  _PredictHeartState createState() => _PredictHeartState();
}

class _PredictHeartState extends State<PredictHeart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('심장질환 예측하기'),
      )
      
    );
  }
}