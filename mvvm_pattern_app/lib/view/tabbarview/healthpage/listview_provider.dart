import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/message.dart';
import 'package:mvvm_pattern_app/modelview/health_list_view_model.dart';
import 'package:mvvm_pattern_app/widgets/health_list.dart';
import 'package:provider/provider.dart';

class ListProvider extends StatefulWidget {
  const ListProvider({ Key? key }) : super(key: key);

  @override
  _ListProviderState createState() => _ListProviderState();
}

class _ListProviderState extends State<ListProvider> {
  @override
  Widget build(BuildContext context) {
  
    final vm = Provider.of<HealthListViewModel>(context);
    vm.queryHealth();
    
    return Scaffold(
      body: Column(
        children: [
          // Expanded: Row, Column, Flex의 자식으로 사용, 부모의 남은 부분을 전부 채움 
          // 사용 방법: UI 상 남은 공간이 없게 화면을 꽉 채우고 싶을 때 사용 
          // 특정 컴포넌트들을 폰 화면 넓이에 맞게 비율로 적용 
          Expanded(
          // HealthList를 위젯화 하여 사용 
          child: HealthList(
            healths: vm.healths,
          ),
        )

        ],
      ),
      
    );
  }
}