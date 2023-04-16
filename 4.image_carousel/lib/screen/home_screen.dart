import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "dart:async";


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final PageController pageController = PageController();
  
  @override
  void initState() {
    super.initState();
    
    Timer.periodic(
      Duration(seconds : 3),
      (timer) {
        int? nextPage = pageController.page?.toInt();
        
        if (nextPage == null) {
          return;
          // 페이지 값이 없을 때 에외처리
        }
        else {
        nextPage == 4 ? nextPage = 0 : nextPage++
        }
        
        // 그냥 3항 연산자로 하는게 깔끔하지 않을까
        // if (nextPage == 4) {
        //   nextPage = 0;
        // }
        // else {
        //   nextPage++;
        // }
        
        PageController.animatePage(
          nextPage,
          duration : Duration(milliseconds : 500),
          curve : Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // TODOs : 사진의 색에 따라서 색상을 바꿔보자
    
    return Scaffold(
      body : Pageview(
        controller : pageController,
        children : 
          [1, 2, 3, 4, 5].map(
            (number) => Image.asset(
              "asset/img/_$number.jpeg",  
              fit : BoxFit.cover,
          ).toList(),
        ),
      ),
    );
  }
}