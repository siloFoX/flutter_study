import "package:flutter/material.dart";

void main() {
  runApp(FloatingActionButtonExample());
}

class FloatingActionButtonExample extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        floatingActionButton : FloatingActionButton(
          onPressed : () {}
          child : Text("클릭"),
          ),
        body : Container(),
        ),
      );
  }
}