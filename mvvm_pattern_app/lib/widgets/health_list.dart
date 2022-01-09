import 'package:flutter/material.dart';

import 'package:mvvm_pattern_app/modelview/health_view_model.dart';

class HealthList extends StatelessWidget {
  // ViewModel Health List 불러오기
  final List<HealthViewModel> healths;
  const HealthList({Key? key, required this.healths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // 삼항 연산자 사용
      child: healths.isEmpty
          ? const Text(
              '데이터가 없습니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final health = healths[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "id :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.id),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Date :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.date),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "runhealth :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.runhealth),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "swimhealth :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.swimhealth),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "hikehealth :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.hikehealth),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "cycclehealth :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.cycclehealth),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "health_time :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.health_time),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "brofood :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.brofood),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "salfood :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.salfood),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "galfood :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.galfood),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "nutfood :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.nutfood),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "broamount :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.broamount),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "salamount :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.salamount),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "galamount :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.galamount),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "nutamount :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.nutamount),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "tabaco :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.tabaco),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "tabaco_amount :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(health.tabaco_amount),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color:
                          index % 2 == 0 ? Colors.amber[50] : Colors.amber[200],
                    ),
                  ),
                  onTap: () {
                  },
                  onLongPress: () {
                  },
                );
              },
              itemCount: healths.length,
            ),
    );
  }
}
