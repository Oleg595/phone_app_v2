import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/data_input_model.dart';
import 'package:phone_app_v2/models/data_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class RowParamsUntouchComponent extends StatelessWidget{
  final DataModel e;

  RowParamsUntouchComponent(this.e);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppDecorations.dataScreenIndentWidth(context),
        Container(
          width: ScreenParams.width(
              SizesInputScreen.widthTextField, context),
          child: Container(
            height: ScreenParams.height(
                SizesDataScreen.heightRows, context),
            alignment: Alignment.center,
              child: Text(
                e.indicator,
                textAlign: TextAlign.center,
              ),
              decoration: AppDecorations.decorationTextRowComponent,),
        ),
        AppDecorations.betweenDataScreenComponents(context),
        Container(
          alignment: Alignment.center,
          height: ScreenParams.height(
              SizesDataScreen.heightRows, context),
          width: ScreenParams.width(
              SizesData.widthLeftComponent, context),
          decoration: AppDecorations.dataTextContainerDecoration(AppColors.defaultScreenColor),
          child: Text(e.toString()),
        ),
        Container(
          width: ScreenParams.width(SizesData.widthMeasure, context),
          child: Text((e as DataInputModel).measurement,),
        ),
      ],
    );
  }
}
