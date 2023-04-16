import "package:flutter/material.dart";

import "package:random_dice/screen/home_screen.dart";
import "package:random_dice/screen/settings_screen/dart";

import "dart:math";
import "package:shake/shake.dart";


class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key : key);
  
  @override
  State<RootScreen> createState => _RootScreenState();
}
  
  
class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {


  TabController? controller;  
  double threshold = 2.7;
  int number = 1;
  ShakeDetecter? shakeDetecter;
  
  
  @override
  void initState() {
    super.initState();
    
    controller = TabController(length : 2, vsync : this);
    
    controller!.addListener(tabListener);
    
    shakeDetecter = ShakeDetecter.autoStart(
      shakeSlopTimeMS : 100,
      shakeThresholdGravity : threshold,
      onPhoneShake : onPhoneShake,
    );
  }
  
  void onPhoneShake() {
    final rand = new Random();
    
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }
  
  tabListener() {
    setState(() {});
  }
  
  
  @override
  dispose() {
    controller!.removeListener(tabListener);
    shakeDetecter!stopListening();
    super.dispose();
  }


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body : TabBarView(
        controller : controller,
        children : renderChildren(),
      ),
      bottomNavigationBar : renderBottomNavigation();
    );
  }
  
  List<Widget> renderChildren() {
    return [
      HomeScreen(number : 1),
      SettingsScreen(
        threshold : threshold,
        onThresholdChange : onThresholdChange,
      ),
    ];
  }

  BottomNavigation renderBottomNavigation () {
    return BottomNavigationBar(
      items : [
        BottomNavigationItem(
          icon : Icon(
            Icons.edgesensor_high_outlined,
          ),
          label : "주사위",
        ),
        
        BottomNavigationItem(
          icon : Icon(
            Icons.settings,
          ),
          label : "설정",
        ),
      ],
    );
  }
  
  void onThresholdChange (double val) {
    setState(() {
      threshold = val;
    });
  }
}