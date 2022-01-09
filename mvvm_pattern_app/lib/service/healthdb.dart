import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_pattern_app/model/health_model.dart';

class DBHealthService {

  Future<List<Health>> queryJSONData(String id) async {
    print(id);
    var url =
        Uri.parse('http://localhost:8080/Flutter/health_query_flutter.jsp?id=$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      final Iterable json = body['results']; 
      // Model Health 에게 전송
      return json.map((health)=> Health.fromJson(health)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  // Insert
  insertJSONData(String id, String date, String runhealth , String swimhealth, String hikehealth, String cycclehealth, String health_time , String brofood,String salfood, String galfood, String nutfood , String broamount, String salamount, String galamount, String nutamount , String tabaco, String tabaco_amount ) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/health_insert_return_flutter.jsp?id=$id&date=$date&runhealth=$runhealth&swimhealth=$swimhealth&hikehealth=$hikehealth&cycclehealth=$cycclehealth&health_time=$health_time&brofood=$brofood&salfood=$salfood&galfood=$galfood&nutfood=$nutfood&broamount=$broamount&salamount=$salamount&galamount=$galamount&nutamount=$nutamount&tabaco=$tabaco&tabaco_amount=$tabaco_amount');
    await http.get(url);
  }

  // Delete
  deleteJSONData(String id) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/health_delete_return_flutter.jsp?id=$id');
    await http.get(url);
  }

  // // Update
  // updateJSONData(String code, String name, String dept, String phone) async {
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/student_update_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
  //   await http.get(url);
  // }


} // End
