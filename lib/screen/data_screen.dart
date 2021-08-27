import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/back_button_component.dart';
import 'package:phone_app_v2/components/column_params_component.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class DataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppDecorations.topNavigationBar(context, NameModules.dataModule,
          BackRouteNames.dataModule, DataParams.dataScreen),
      backgroundColor: AppColors.defaultScreenColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(AppIcons.downMenu),
        onPressed: () => {Navigator.pop(context)},
      ),
      body: Column(children: [
        ColumnParamsComponent(false),
      ]),
      bottomSheet: Container(
          alignment: Alignment.topLeft,
          color: AppColors.defaultScreenColor,
          height: ScreenParams.heightSafeArea(
              SizesHelpScreen.highBottomButton, context),
          child: BackButtonComponent(
              BackRouteNames.menuModule, DataParams.menuScreen)),
      resizeToAvoidBottomInset: false,
    ));
  }
}
