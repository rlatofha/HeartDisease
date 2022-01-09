import 'package:mvvm_pattern_app/model/login_model.dart';


class LoginModelView{
  late LoginModel loginmodel;

  LoginModelView({required this.loginmodel});

  String get id {
    return loginmodel.id;
  }

  String get password {
    return loginmodel.password;
  }
  
}
