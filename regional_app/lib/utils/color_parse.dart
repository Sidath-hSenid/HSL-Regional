import 'package:flutter/material.dart';

class ColorParse{
  Color parseColor(String colorString) {
    int? value = int.tryParse(colorString);
    return Color(value!);
  }
}