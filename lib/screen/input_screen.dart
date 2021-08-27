import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/column_input_screen.dart';
import 'package:phone_app_v2/components/column_input_screen_padding.dart';
import 'package:phone_app_v2/components/navigation_bar_component.dart';
import 'package:phone_app_v2/models/column_input_screen_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

class InputScreen extends StatelessWidget {
  final String data;
  final int number;
  ColumnInputScreenModel column;

  InputScreen(this.data, this.number, bool isPad){
    if(isPad){
      column = ColumnInputScreenPadding(data, number);
    }
    else{
      column = ColumnInputScreen(data, number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppDecorations.topNavigationBar(context, NameModules.indicatorsModule, BackRouteNames.indicatorsModule, DataParams.screens[number]),
      backgroundColor: AppColors.defaultScreenColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(AppIcons.upMenu),
        onPressed: () => {Navigator.push(context, Routes.toDataRoute(context))},
      ),
      body: Center(
          child: column),
      bottomNavigationBar: NavigationBarComponent(number),
    ));
  }
}
