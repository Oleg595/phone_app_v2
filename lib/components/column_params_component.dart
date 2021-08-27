import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/row_params_popup_component.dart';
import 'package:phone_app_v2/components/row_params_touch_component.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

class ColumnParamsComponent extends StatelessWidget {
  final bool isHomeScreen;

  ColumnParamsComponent(this.isHomeScreen);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DataParams.toDefault,
      builder: (context, dynamic, widget) => Column(
        children: DataParams.data
            .map((e) => Column(children: [
                  AppDecorations.dataScreenIndentHeight(context),
                  ((e.isNumberType()) || (!isHomeScreen))
                      ? RowParamsTouchComponent(e, isHomeScreen)
                      : RowParamsPopupComponent(e.indicator, DataParams.data.indexOf(e)),
                ]))
            .toList(),
      ),
    );
  }
}
