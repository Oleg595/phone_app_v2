import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/tile_name_params.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppDecorations.topNavigationBar(context, NameModules.menuModule, BackRouteNames.menuModule, DataParams.menuScreen),
        body: Container(
            alignment: Alignment.center,
            color: AppColors.defaultScreenColor,
            child: SingleChildScrollView(
              child: Column(
                  children: [
                AppDecorations.betweenMenuButtons(context),
                Container(
                  decoration: AppDecorations.menuContainerDecoration(),
                  height: ScreenParams.heightSafeArea(9, context),
                  width: ScreenParams.width(SizesMenu.widthMenuButtons, context),
                  child: ElevatedButton(
                    style: AppDecorations.homeButtonsStyle(context),
                    onPressed: () => {
                      Navigator.push(context, Routes.toInputScreen(context, 0))
                    },
                    child: Text(
                      TextConstants.inputData,
                      style: AppDecorations.menuTextStyle,
                    ),
                  ),
                ),
                AppDecorations.betweenMenuButtons(context),
                Container(
                  decoration: AppDecorations.menuContainerDecoration(),
                  height: ScreenParams.heightSafeArea(9, context),
                  width: ScreenParams.width(SizesMenu.widthMenuButtons, context),
                  child: ElevatedButton(
                    style: AppDecorations.homeButtonsStyle(context),
                    onPressed: () =>
                        {Navigator.push(context, Routes.toHomeRoute(context))},
                    child: Text(
                      NameModules.dataModule,
                      style: AppDecorations.menuTextStyle,
                    ),
                  ),
                ),
                AppDecorations.betweenMenuButtons(context),
                Container(
                  decoration: AppDecorations.menuContainerDecoration(),
                  width: ScreenParams.width(SizesMenu.widthMenuButtons, context),
                  child: TileNameParams(),
                ),
              ]),
            )),
      ),
    );
  }
}
