import 'package:flutter/material.dart';

class News1 extends StatefulWidget {
  const News1({Key? key}) : super(key: key);

  @override
  _News1State createState() => _News1State();
}

class _News1State extends State<News1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('흡연의 위험성'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              Image(
                width: 500.0,
                height: 300,
                image: AssetImage(
                  'images/tab_three_asset/smoke.jpeg',
                ),
                fit: BoxFit.fill,
              ),
              Text(
                '금연은 흡연보다 좋지만 완전한 심장 회복 시간 10~15년 걸려미국 연구팀, 20일 JAMA에 연구 발표',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    "[메디칼업저버 주윤지 기자] 심장은 금연하는 즉시 회복되기 시작하지만 완전한 회복까지는 15년까지 걸릴 수 있다는 새로운 연구가 발표됐다. 전문가들은 흡연자가 담배를 끊으면 심장마비, 뇌졸중, 심장사 또는 심장질환으로 인한 사망 위험이 5년 이내에 정상으로 돌아온다고 일반적으로 생각했지만, 최근에 JAMA에 발표된 연구에 따르면 10~15년까지 걸릴 수 있다.미국 밴더빌트 대학교 메디컬센터 Meredith Duncan 연구팀은 이 연구에서 지속적 흡연 혹은 금연을 한 사람들을 비교·분석했다.그 결과, 금연을 선택한 사람들은 흡연하는 사람보다 심장병 위험이 5년 이내 상당히 감소했지만, 담배를 끊은 사람은 한 번도 흡연하지 않은 사람과 비교했을 때 심장병 위험이 더 높았다. 연구 결과를 따르면 담배를 자주 피우는 흡연자들은 최소 10년 동안 심장 문제가 비흡연자보다 높아 주의가 필요하다.주 저자 Duncan은 완전한 회복에는 몇 년이 걸릴 수 있음으로 현재 흡연자들이 금연하고 좋은 장기 중단 계획을 세우고 심장 건강을 향한 다른 단계를 논의하기 위해 의사와 약속을 잡는 것이 좋다고 충고했다. 이 연구는 Framingham Heart Study에 참여한 약 8800명의 데이터를 포함했다. 참가자 중 약 5300명은 담배를 피운 사람들과 약 2400명은 담배를 많이 피워 20년 동안 하루에 적어도 한 팩을 피운 사람들이었다. 참가자의 56%는 여성이었다. 평균 26년 추적관찰 하는 동안 2400명 이상의 참가자가 심장마비, 뇌졸중, 심부전 또는 심장병으로 사망했다. 이 중 약 1100명은 매일 한 팩을 피우는 사람들이었다. 연구진은 사람이 나이가 들수록 질환을 앓게 되지만 담배를 피우는 기간과 양에 따라 영향이 클 수 있다고 밝혔다.이 연구는 지난 20일 JAMA에 실렸다."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
