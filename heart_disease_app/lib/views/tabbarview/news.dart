import 'package:flutter/material.dart';

class NewsAPI extends StatefulWidget {
  const NewsAPI({ Key? key }) : super(key: key);

  @override
  _NewsAPIState createState() => _NewsAPIState();
}

class _NewsAPIState extends State<NewsAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: const Text("NEWS"),
      )
    );
  }
}