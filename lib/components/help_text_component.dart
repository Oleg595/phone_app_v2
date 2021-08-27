import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/help_data_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class HelpTextComponent extends StatelessWidget{
  final HelpDataModel helpDataModel;

  HelpTextComponent(this.helpDataModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: ScreenParams.width(SizesHelpScreen.widthScrollView, context),
        child: Column(children: [
          Column(children: [
            AppDecorations.betweenHelpScreenComponents(context),
            Text(
              helpDataModel.aboutModule.nameObject,
              style: AppDecorations.helpModuleNameStyle,
            ),
            AppDecorations.betweenHelpScreenComponents(context),
            Text(helpDataModel.aboutModule.describeObject,
                style: AppDecorations.helpTextStyle),
            AppDecorations.betweenHelpScreenComponents(context),
          ]),
          Column(
            children: helpDataModel.data
                .map((e) => Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.disableButtonColor),
                    ),
                  ),
                child: ExpansionTile(
                  title: Text(
                    e.nameObject,
                    style: AppDecorations.helpButtonNameStyle,
                  ),
                  expandedAlignment: Alignment.centerLeft,
                  children: [Text(e.describeObject,
                      style: AppDecorations.helpTextStyle),],
                  textColor: AppColors.textColor,
                  collapsedTextColor: AppColors.buttonColor,
                  iconColor: AppColors.textColor,
                  collapsedIconColor: AppColors.buttonColor,
                ),),
                AppDecorations.betweenHelpScreenComponents(context),
              ],
            ))
                .toList(),
          )
        ]),
      ),
    );
  }
}