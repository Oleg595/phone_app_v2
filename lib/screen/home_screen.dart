import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/column_params_component.dart';
import 'package:phone_app_v2/components/row_params_untouch_component.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppDecorations.topNavigationBar(context, NameModules.homeModule, BackRouteNames.homeModule, DataParams.screens.last),
      body: SingleChildScrollView(
        child: Column(
    children: [
          ValueListenableBuilder(
            builder : (context, value, child) => ColumnParamsComponent(true),
            valueListenable: DataParams.toDefault,
          ),
          AppDecorations.dataScreenIndentHeight(context),
          ValueListenableBuilder(
            builder : (context, value, child) => RowParamsUntouchComponent(DataParams.resultData),
            valueListenable: DataParams.toDefault,
          ),
          SizedBox(height: ScreenParams.height(2, context),),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(
                  context, Routes.backForwardRoute(context, true, -1))
            },
            style: AppDecorations.homeButtonsStyle(context),
            child: Text(TextConstants.enterData),
          ),
          AppDecorations.dataScreenIndentHeight(context),
          ElevatedButton(
            onPressed: () {
              DataParams.toDefaultParams();
              this.build(context);
            },
            style: AppDecorations.homeButtonsStyle(context),
            child: Text(TextConstants.deleteData),
          ),
          AppDecorations.dataScreenIndentHeight(context),
          ValueListenableBuilder(
              builder : (context, value, child) => ElevatedButton(
                onPressed: (DataParams.canGetResults()) ? () {
                  DataParams.getResults();
                  Navigator.push(context, Routes.toResultScreen(context));
                } : null,
                style: AppDecorations.homeButtonsStyle(context),
                child: Text(TextConstants.getResults),
              ),
            valueListenable: DataParams.toDefault,
          ),
        ]),
      ),
      backgroundColor: AppColors.defaultScreenColor,
    ));
  }
}
