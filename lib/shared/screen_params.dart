import 'package:flutter/cupertino.dart';

class ScreenParams{
  static double height(int percent, BuildContext context){
    return MediaQuery.of(context).size.height * percent / 100;
  }

  static double width(int percent, BuildContext context){
    return MediaQuery.of(context).size.width * percent / 100;
  }

  static double heightSafeArea(int percent, BuildContext context){
    var padding = MediaQuery.of(context).padding;
    return (MediaQuery.of(context).size.height - padding.top - padding.bottom) * percent / 100;
  }
}
