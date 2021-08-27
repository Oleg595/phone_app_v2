import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/back_button_component.dart';
import 'package:phone_app_v2/components/help_text_component.dart';
import 'package:phone_app_v2/models/help_data_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class HelpScreen extends StatelessWidget {
  final Widget backScreen;
  final String data;
  final String moduleName;
  HelpDataModel helpDataModel;

  HelpScreen(this.backScreen, this.data, this.moduleName) {
    helpDataModel = DataParams.getHelpParams(moduleName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text(NameModules.helpModule),
          backgroundColor: AppColors.defaultScreenColor,
          transitionBetweenRoutes: false,
        ),
        body: SingleChildScrollView(
          child: HelpTextComponent(helpDataModel),
        ),
        bottomSheet: Container(
          alignment: Alignment.topLeft,
          color: AppColors.defaultScreenColor,
          height: ScreenParams.heightSafeArea(SizesHelpScreen.highBottomButton, context),
          child: BackButtonComponent(data, backScreen),
        ),
        backgroundColor: AppColors.defaultScreenColor,
      ),
    );
  }
}
