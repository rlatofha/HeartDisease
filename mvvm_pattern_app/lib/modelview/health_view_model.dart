import 'package:mvvm_pattern_app/model/health_model.dart';

class HealthViewModel{
  // Model 생성자 생성 
  late Health health;
  
  // Model에서의 생성자의 속성 값을 가져온다. 
  HealthViewModel({required this.health});

  String get id{
    return health.id;
  }

  String get date{
    return health.date;
  }

  String get runhealth{
    return health.runhealth;
  }

  String get swimhealth{
    return health.swimhealth;
  }

  String get hikehealth{
    return health.hikehealth;
  }

  String get cycclehealth{
    return health.cycclehealth;
  }

  String get health_time{
    return health.health_time;
  }

  String get brofood{
    return health.brofood;
  }

  String get salfood{
    return health.salfood;
  }

  String get galfood{
    return health.galfood;
  }

  String get nutfood{
    return health.nutfood;
  }
  String get broamount{
    return health.broamount;
  }

  String get salamount{
    return health.salamount;
  }

  String get galamount{
    return health.galamount;
  }

  String get nutamount{
    return health.nutamount;
  }

  String get tabaco{
    return health.tabaco;
  }
  String get tabaco_amount{
    return health.tabaco_amount;
  }






  

}