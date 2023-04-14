import "package:flutter/material.dart";
import "package:random_dice/screen/home_screen.dart";
import "package:random_dice/screen/root_screen.dart";
import "package:random_dice/const/colors.dart";



void main() {
  runApp(
    MaterialApp(
      theme : ThemeData(
        
        scaffoldBackgroundColor : backgroundColor,
        
        sliderTheme : SlitherThemeData(
          thumbColor : primaryColor,
          activeTrackColor : primaryColor,
          inactiveTrackColor : primaryColor.withOpacity(0.3),
        ),
        
        bottomNavigationBarTheme : BottomNavigationBarThemeData(
          selectedItemColor : primaryColor,
          unselctedItemColor : secondaryColor,
          backgroundColor : backgroundColor,
        ),
      ),
      home : RootScreen(),
    ),
  );
}