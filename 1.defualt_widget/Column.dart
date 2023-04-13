import "package:flutter/material.dart";

void main() {
  runApp(ColumnWidgetExample());
}

class ColumnWidgetExample extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {
    
    return MaterialApp(
      home : Scaffold(
        body : SizeBox(
          width : double.infinity,
          child : Column(
            mainAxisAlignment : MainAxisAlignment.start,
              corssAxisAlignment.center,
            
            children : [
              Container(
                height : 50.0.
                width : 50.0,
                color : Colors.red,
              ),
                
            const SizedBox(width : 12.0),
              Container(
                height : 50.0,
                width : 50.0,
                color : Colors.green,
              ),
              
            const SizedBox(width : 12.0),
              Container(
                height : 50.0,
                width : 50.0,
                color : Colors.blue,
              ),
            ],
          ),
        ),
      ),
    ),
  }
}