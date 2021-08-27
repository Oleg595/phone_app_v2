import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/components/popup_menu_component.dart';
import 'package:phone_app_v2/models/column_input_screen_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class ColumnInputScreenPadding extends ColumnInputScreenModel {

  ColumnInputScreenPadding(String data, int number) : super(data, number);

  @override
  _ColumnInputScreenPaddingState createState() =>
      _ColumnInputScreenPaddingState();
}

class _ColumnInputScreenPaddingState extends State<ColumnInputScreenPadding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            child: ValueListenableBuilder(valueListenable: DataParams.toDefault,
                builder: (context, value, child) => PopupMenuComponent(widget.number, widget.data),),
            height: ScreenParams.height(
                SizesInputScreen.heightTextFieldContainer, context),
            width: ScreenParams.width(SizesInputScreen.widthTextField, context),
            decoration: AppDecorations.dataTextContainerDecoration(AppColors.defaultScreenColor)),
      ],
    );
  }
}
