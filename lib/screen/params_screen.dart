import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/back_button_component.dart';
import 'package:phone_app_v2/models/indicator_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class ParamsScreen extends StatelessWidget {
  final IndicatorModel param;

  ParamsScreen(this.param);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text(param.name),
          backgroundColor: AppColors.defaultScreenColor,
          transitionBetweenRoutes: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppDecorations.betweenHelpScreenComponents(context),
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  width: ScreenParams.width(
                      SizesHelpScreen.widthScrollView, context),
                  child:
                      Text(param.description, style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          alignment: Alignment.topLeft,
          color: AppColors.defaultScreenColor,
          height: ScreenParams.heightSafeArea(10, context),
          child: BackButtonComponent(
              BackRouteNames.menuModule, DataParams.menuScreen),
        ),
        backgroundColor: AppColors.defaultScreenColor,
      ),
    );
  }
}
