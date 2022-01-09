import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_pattern_app/view/tabbarview/newspage/news1.dart';
import 'package:mvvm_pattern_app/view/tabbarview/newspage/news2.dart';
import 'package:mvvm_pattern_app/view/tabbarview/newspage/news3.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({ Key? key }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
   final dummyItems = [
    'images/tab_one_asset/26210_26772_214.jpg',
    'images/tab_one_asset/cm260026242_l.jpg',
    'images/tab_one_asset/blood.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTop(),
        const SizedBox(
          height: 10,
        ),
        _news1p(context),
        _news1t(context),
        _news2p(context),
        _news2t(context),
        _news3p(context),
        _news3t(context)
      ],
    );
  }

  Widget _buildTop() {
    return CarouselSlider(
      items: dummyItems.map(
        (uri) {
          return Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    uri,
                    fit: BoxFit.cover,

                  ),

                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
      ),
    );
  }
}

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(
              child: Image(
                image: AssetImage(
                  'images/tab_three_asset/smoke.jpeg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _news1p(BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const News1()));
      },
      child: Column(
        children: const [
          Image(
            width: 500.0,
            height: 150,
            image: AssetImage(
              'images/tab_one_asset/26210_26772_214.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ],
      ),
    ),
  );
}

Widget _news1t(BuildContext context) {
  return Center(
    child: Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const News1()));
            },
            child: const Text('담배를 끊어도 10년이 지나야 심장이 회복한다',
                style: TextStyle(fontSize: 20)))
      ],
    ),
  );
}

Widget _news2p(BuildContext context) {
  return Center(
      child: GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const News2()));
    },
    child: Column(
      children: const [
        Image(
          width: 500.0,
          height: 150,
          image: AssetImage(
            'images/tab_three_asset/food.jpeg',
          ),
          fit: BoxFit.fill,
        ),
      ],
    ),
  ));
}

Widget _news2t(BuildContext context) {
  return Center(
    child: Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const News2()));
            },
            child: const Text('심장에 좋은 영양소 ...함유 식품5',
                style: TextStyle(fontSize: 20)))
      ],
    ),
  );
}

Widget _news3p(BuildContext context) {
  return Center(
      child: GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const News3()));
    },
    child: Column(
      children: const [
        Image(
          width: 500.0,
          height: 150,
          image: AssetImage(
            'images/tab_one_asset/blood.jpeg',
          ),
          fit: BoxFit.fill,
        ),
      ],
    ),
  ));
}

Widget _news3t(BuildContext context) {
  return Center(
    child: Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const News3()));
            },
            child: const Text('심혈관 질환 앓으면 나쁜 콜레스테롤 70 미만 유지해야',
                style: TextStyle(fontSize: 20)))
      ],
    ),
  );
}
