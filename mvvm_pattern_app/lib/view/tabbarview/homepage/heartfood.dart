import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HeartFood extends StatefulWidget {
  const HeartFood({ Key? key }) : super(key: key);

  @override
  _HeartFoodState createState() => _HeartFoodState();
}

class _HeartFoodState extends State<HeartFood> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
          WebView(

            initialUrl: 'https://www.youtube.com/watch?v=GTV-1HxBSn8',
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
      
      
      //   // 화면 뒤로 가기 눌렀을 때, 
      // floatingActionButton: FutureBuilder<WebViewController>(
      //   future: _controller.future,
      //   // snapshot 전 화면의 메모리가 저장 
      //   builder: (BuildContext context, AsyncSnapshot<WebViewController> controller){
      //     if(controller.hasData){
            
      //       return FloatingActionButton(

      //         child: (
      //           children: const [
      //             Icon(Icons.arrow_back),
      //             Icon(Icons.replay),
      //             Icon(Icons.arrow_forward)
      //           ],
      //         ),
      //           /*
      //           const Icon(Icons.arrow_back),
      //           backgroundColor: Colors.red,
      //           */
      //           onPressed: (){
      //           controller.data!.goBack();
      //         },

              
      //       );
      //     }
      //     return Stack();
      //   }, 
      // ),

      
      
    );
  }
}