import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/back_button_component.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppDecorations.topNavigationBar(context, NameModules.resultModule, BackRouteNames.resultModule, DataParams.resultScreen),
        body: Column(
          children: DataParams.results
              .map((e) => Column(
              children: [
                SizedBox(height: ScreenParams.height(5, context),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: ScreenParams.width(5, context)),
                      Container(
                        width: ScreenParams.width(40, context),
                        child: Text(e.indicator, style: TextStyle(fontSize: 20,),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: AppDecorations.dataTextContainerDecoration(DataParams.resultColor),
                        width: ScreenParams.width(50, context),
                        child: Text(e.toString(), style: TextStyle(color: DataParams.fontResultColor, fontSize: 20),),
                      ),
                    ],
                  ),]))
              .toList(),
        ),
        bottomSheet: Container(
          alignment: Alignment.topRight,
          color: AppColors.defaultScreenColor,
          height: ScreenParams.height(10, context),
          width: ScreenParams.width(50, context),
          child: BackButtonComponent(BackRouteNames.menuModule, DataParams.menuScreen),
        ),
        backgroundColor: AppColors.defaultScreenColor,
      ),
    );
  }
}
