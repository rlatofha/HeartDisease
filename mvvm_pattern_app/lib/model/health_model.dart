class Health{

  late String id;
  late String date;

  late String runhealth = '';
  late String swimhealth = '';
  late String hikehealth = '';
  late String cycclehealth = '';

  late String health_time = ''; 
  
  late String brofood= '';
  late String salfood = '';
  late String galfood = '';
  late String nutfood = '';

  late String broamount= '';
  late String salamount = '';
  late String galamount = '';
  late String nutamount = '';

  late String tabaco = '';

  late String tabaco_amount = '';
  // required: 개발자가 파라미터를 입력하지 않으면 null로 채워지고 프로그램은 정상동작 
  Health({
    required this.id, required this.date,  required this.runhealth,  required this.swimhealth,  required this.hikehealth,  required this.cycclehealth,  required this.health_time,
     required this.brofood,  required this.salfood,  required this.galfood,  required this.nutfood,  required this.broamount,
     required this.salamount,  required this.galamount,  required this.nutamount,  required this.tabaco,  required this.tabaco_amount
  });

  // 파일 전송형태는 Json 
  // Map = Dictionary 형태 == Key : value 
  // factory = 생성자를 여러번 호출해도 결국 초기에 만들어진 하나의 생성자만 사용(싱글톤 패턴)
  // 사용이유: 내부가 변경되어도 모델 생성을 관여하지 않기 때문에 수정을 최소화
  // 예상치 못한 상황에 유연하게 대응 / static 효과 
    factory Health.fromJson(Map<String, dynamic> json) {
      return Health(
        id: json['id'],
        date: json['date'], 
        runhealth: json['runhealth'],
        swimhealth: json['swimhealth'], 
        hikehealth: json['hikehealth'],
        cycclehealth: json['cycclehealth'], 
        health_time: json['health_time'],
        brofood: json['brofood'], 
        salfood: json['salfood'],
        galfood: json['galfood'], 
        nutfood: json['nutfood'],
        broamount: json['broamount'], 
        salamount: json['salamount'],
        galamount: json['galamount'], 
        nutamount: json['nutamount'],
        tabaco: json['tabaco'], 
        tabaco_amount: json['tabaco_amount']
      ); 
   }

}