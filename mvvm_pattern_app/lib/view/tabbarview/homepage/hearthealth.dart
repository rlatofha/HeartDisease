import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewHeartHealth extends StatefulWidget {
  const ViewHeartHealth({ Key? key }) : super(key: key);

  @override
  _ViewHeartHealthState createState() => _ViewHeartHealthState();
}

class _ViewHeartHealthState extends State<ViewHeartHealth> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          WebView(

            initialUrl: 'https://www.youtube.com/watch?v=CRx9l_yT0wI',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
            onPageFinished: (finish){
              setState(() {
                isLoading = false;
              });
            },

            onPageStarted: (start){
              setState(() {
                isLoading = true;
              });
            },


          ),
          isLoading ? const Center(
            // 로딩 회전 화면 표시 보여주기 
            child: CircularProgressIndicator(),
          )
          : Stack()
        ],

      ),    
    );
  }
}