import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class TileNameParams extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        NameModules.indicatorsModule,
        style:
        TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
      expandedAlignment: Alignment.center,
      children: DataParams.indicatorModels
          .map((e) => Column(
          children: [Container(
              height: ScreenParams.heightSafeArea(5, context),
              width: ScreenParams.width(70, context),
              child: ElevatedButton(
                onPressed: () => {Navigator.push(context, Routes.toParamScreen(context, e))},
                child: Text(e.name),
              )),
            SizedBox(height: ScreenParams.heightSafeArea(2, context),)]),
      )
          .toList(),
      childrenPadding: EdgeInsets.only(left: 1.0),
      backgroundColor: AppColors.defaultScreenColor,
      collapsedBackgroundColor: AppColors.buttonColor,
      textColor: AppColors.buttonColor,
      collapsedTextColor: AppColors.defaultScreenColor,
      iconColor: AppColors.buttonColor,
      collapsedIconColor: AppColors.defaultScreenColor,
    );
  }
}
