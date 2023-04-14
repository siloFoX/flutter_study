import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

class HomeScreen extends StatelessWidget {
  
  WebViewController? controller;
  // null 값이 가능하도록 되어있음
  
  HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      
      appBar : AppBar(
        backgroundColor : Colors.orange,
        title : Text("Silofox"),
        centerTitle : true,
      ),
      
      actions : [
        IconButton(
          onPressed : () {
            if (controller != null) {
              controller!.loadUrl("http:silofox.github.io");
              // controller 가 절대로 null 값이 아니므로 ! 를 붙여줌
            }
          },
          icon : Icon(
            Icons.home,
          ),
        ),
      ],
      
      body : Webview(
        onWebViewCreated : (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl : "http://silofox.github.io",
        javascriptMode : JavascriptMode.unrestricted,
      ),
    );
  }
}