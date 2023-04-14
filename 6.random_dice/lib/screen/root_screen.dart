import "package:flutter/material.dart";


class RootScreen extends StatelessWidget {
  
  const RootScreen({Key? key}) : super(key : key);
  
  @override
  State<RootScreen> createState => _RootScreenState();
}
  
class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {

  TabController? controller;  
  
  @override
  void initState() {
    super.initState();
    
    controller = TabController(length : 2, vsync : this);
    
    controller!.addListener(tabListener);
  }
  
  tabListener() {
    setState(() {});
  }
  
  @override
  dispose() {
    controller!.removeListener(tabListener);
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
      Container(
        child : Center(
          child : Text(
            "Tab 1",
            style : TextStyle(
              color : Colors.white,
            ),
          ),
        ),
      ),
      Container(
        child : Center(
          child : Text(
            "Tab 2",
            style : Colors.white,
          ),
        ),
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
}