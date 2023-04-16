import "package:flutter/material.dart";
import "package:random_dice/const/colors.dart";


class SettingsScreen extends StatelessWidget {
  
  final double threshold;
  final ValueChanged<double> onThresholdChange;
  
  const SettingsScreen({
    Key? key,
    required this.threshold,
    required this.onThresholdChange,
  }) : super(key : key);
  
  @override
  Widget build (BuildContext contex) {
    return Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children : [
        Padding(
          padding : const EdgeInsets.only(left : 20.0),
          child : Row(
            children : [
              Text(
                "Sensitivity",
                style : TextStyle(
                  color : secondaryColor,
                  fontSize : 20.0,
                  fontWeight : FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Slider(
          min : 0.1,
          max : 10.0,
          divisions : 101,
          value : threshold,
          onChanged : onThresholdChange,
          label : threshold.toStringAsFixed(1)
        ),
      ],
    );
  }
}