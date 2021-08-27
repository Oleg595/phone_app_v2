import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/column_input_screen_model.dart';
import 'package:phone_app_v2/models/data_input_model.dart';
import 'package:phone_app_v2/models/key_work_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class ColumnInputScreen extends ColumnInputScreenModel {
  ColumnInputScreen(String data, int number) : super(data, number);

  @override
  _ColumnInputScreenState createState() => _ColumnInputScreenState();
}

class _ColumnInputScreenState extends State<ColumnInputScreen> {
  GlobalKey<FormState> _productKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.data,
          style: AppDecorations.defaultTextStyle,
        ),
        AppDecorations.afterTextInputScreen(context),
        Container(
          alignment: Alignment.topCenter,
          child: Form(
              key: _productKey,
              child: TextFormField(
                initialValue: DataParams.data[widget.number].toString(),
                keyboardType: TextInputType.number,
                decoration: AppDecorations.textFieldDecoration(widget.data),
                enabled: true,
                validator: (input) => KeyWorkModel.validator(input, DataParams.data[widget.number] as DataInputModel),
                onSaved: (input) => KeyWorkModel.saved(input, widget.number),
                onFieldSubmitted: (input) => KeyWorkModel.submitted(input, _productKey),
              )),
          height:
              ScreenParams.height(SizesInputScreen.heightTextField, context),
          width: ScreenParams.width(SizesInputScreen.widthTextField, context),
        ),
      ],
    );
  }
}
