import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";


class HomeScreen extends StatefulWidget {
  
  const HomeScreen({Key? key}) : super(key : key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // DateTime firstDay = DateTime.now();
  DateTime firstDay = DateTime(2022,11,14);
  
  @override
  Widget build (BuildContext context) {
    
    return Scaffold(
      backgroundColor : Colors.pink[100],
      
      body : SafeArea(
        top : true,
        bottom : false,
        
        child : Column(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          crossAxisAlignment : CrossAxisAlignment.stretch,
          
          children : [
            _DDay(
              onShieldPressed : onShieldPressed,
              firstDay : firstDay,
              ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
  
  void onShieldPressed() {
    
    showCupertinoDialog(
      context : context, // 어디의 context 를 받는 것일까?
      builder : (BuilderContext context) {
        return Align(
          alignment : Alignment.bottomCenter,
          child : Container(
            color : Colors.white,
            height : 300,
            child : CupertinoDatePicker(
              mode : CupertinoDatePickerMode.date,
              onDateTimeChanged : (DateTime date) {
                setState(() {
                 firstDay = date; 
                });
              },
            );
          ),
        );
      },
      barrierDismissible : true,
      // 외부 클릭하면 닫힘
    );
  }
  
}


class _DDay extends StatelessWidget {
  
  final GestureTapCallback onShieldPressed;
  final DateTime firstDay;
  
  // 상위에서 함수 입력받음
  _DDay({
    require this.onShieldPressed,
    require this.firstDay,
  });
  
  @override
  Widget build (BuildContext context) {
    
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();
  
    return Column(
      children : [
        const SizedBox(height : 16.0),
        Text(
          "군대", 
          style : textTheme.headline1,
        ),
        
        const SizedBox(height : 16.0),
        Text(
          "입대한 날",
          style : textTheme.bodyText1,
        ),
        Text(
          "${firstDay.year}.${firstDay.month}.${firstDay.day}",
          style : textTheme.bodyText2,
        ),
        
        constSizedBox(height : 16.0),
        
        Column(
          children :[
            
            Expanded(
              IconButton(
                iconSize : 60.0,
                onPressed : onShieldPressed,
                
                icon : Icon(
                  Icons.shield_fill,
                  color : Colors.green,
                ),
              ),
            ),
            
            Expanded(
              IconButton(
                iconSize : 60.0,
                onPressed : onShieldPressed,
                
                icon : Icon(
                  Icons.shield_lefthalf_fill,
                  backgroundColor : Colors.transparent,
                  color : Colors.black,
                ),
              ),
            ),
            
          ],
        ),
        const SizedBox(height : 16.0),
        Text(
          "D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}",
          style : textTheme.headline2,
        ),
      ],
    );
  }
}


class _CoupleImage extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {
    return Expanded(
      child : Center(
        child : Image.asset(
          "asset/img/middle_image.png",
          height : MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}