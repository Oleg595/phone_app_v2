import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/popup_menu_component.dart';
import 'package:phone_app_v2/models/column_input_screen_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class RowParamsPopupComponent extends ColumnInputScreenModel{
  RowParamsPopupComponent(String data, int number) : super(data, number);

  @override
  _RowParamsPopupComponentState createState() => _RowParamsPopupComponentState();
}

class _RowParamsPopupComponentState extends State<RowParamsPopupComponent>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppDecorations.dataScreenIndentWidth(context),
        Container(
          width: ScreenParams.width(
              SizesInputScreen.widthTextField, context),
          child: ElevatedButton(
              child: Text(
                DataParams.data[widget.number].indicator,
              ),
              style: AppDecorations.paramsButtonStyle(context),
              onPressed: (DataParams.data[widget.number].toString().isNotEmpty) ? () {
                return Navigator.push(context,
                    Routes.toInputScreen(context, DataParams.data.indexOf(DataParams.data[widget.number])));
              } : null),
        ),
        AppDecorations.betweenDataScreenComponents(context),
        Container(
          alignment: Alignment.center,
          height: ScreenParams.height(
              SizesDataScreen.heightRows, context),
          width: ScreenParams.width(
              SizesDataScreen.widthValueCell, context),
          decoration: AppDecorations.dataTextContainerDecoration(AppColors.defaultScreenColor),
          child: ValueListenableBuilder(valueListenable: DataParams.toDefault, builder: (context, value, child) =>
              PopupMenuComponent(widget.number, widget.data),),
        ),
      ],
    );
  }
}
