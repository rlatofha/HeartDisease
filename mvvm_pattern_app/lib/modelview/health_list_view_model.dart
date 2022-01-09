import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/message.dart';
import 'package:mvvm_pattern_app/modelview/health_view_model.dart';
import 'package:mvvm_pattern_app/service/healthdb.dart';


class HealthListViewModel extends ChangeNotifier{
  List<HealthViewModel> healths = <HealthViewModel>[];

  // List화 시켜서 보낼준비를 한다.
  // service에서 함수를 호출해서 가져온다. 
  // Key:value map type으로 보내준다. 
  Future<void> queryHealth() async {
    final results = await DBHealthService().queryJSONData(Message.id);
    healths = results.map((item) => HealthViewModel(health: item)).toList();
    notifyListeners();
  }
}