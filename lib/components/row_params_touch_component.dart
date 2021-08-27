import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/data_input_model.dart';
import 'package:phone_app_v2/models/data_model.dart';
import 'package:phone_app_v2/models/key_work_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class RowParamsTouchComponent extends StatefulWidget{
  final DataModel e;
  final bool isHomeScreen;
  bool canImage;

  RowParamsTouchComponent(this.e, this.isHomeScreen);

  @override
  _RowParamsTouchComponentState createState() => _RowParamsTouchComponentState();
}

class _RowParamsTouchComponentState extends State<RowParamsTouchComponent>{
  final _productKey = GlobalKey<FormState>();
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    if(_controller == null) {
      _controller = TextEditingController(text: widget.e.toString());
    }
  }

  void initBuild(){
    int number = 0;
    for(; number < DataParams.data.length; number++){
      if(DataParams.data[number].toString().isEmpty){
        break;
      }
    }

    if(widget.isHomeScreen){
      if(widget.e.toString().isNotEmpty){
        widget.canImage = true;
      }
      else {
        widget.canImage = false;
      }
    }
    else{
      if(DataParams.data.indexOf(widget.e) <= number){
        widget.canImage = true;
      }
      else {
        widget.canImage = false;
      }
    }

    if((!widget.canImage)){
      _controller.clear();
    }
    else{
      if(_controller.text != widget.e.toString()){
        _controller.text = widget.e.toString();
        if(!_productKey.currentState.validate()){
          _controller.clear();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initBuild();

    return Row(
      children: [
        AppDecorations.dataScreenIndentWidth(context),
        Container(
          width: ScreenParams.width(
              SizesInputScreen.widthTextField, context),
          child: ElevatedButton(
              child: Text(
                widget.e.indicator,
              ),
              style: AppDecorations.paramsButtonStyle(context),
              onPressed: (widget.canImage) ? () {
                return Navigator.push(context,
                    Routes.toInputScreen(context, DataParams.data.indexOf(widget.e)));
              } : null),
        ),
        AppDecorations.betweenDataScreenComponents(context),
        Container(
          alignment: Alignment.center,
          height: ScreenParams.height(
              SizesDataScreen.heightRows, context),
          width: ScreenParams.width(
              (widget.e is DataInputModel) ? SizesData.widthLeftComponent : SizesDataScreen.widthValueCell, context),
          decoration: AppDecorations.dataTextContainerDecoration(AppColors.defaultScreenColor),
          child: (widget.isHomeScreen) ? Form(
            key: _productKey,
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: AppDecorations.textFieldMenuDecoration,
              onChanged: (input) => KeyWorkModel.changed(input, widget.e, _productKey),
              onTap: () => DataParams.updateScreens(),
              onEditingComplete: () => _productKey.currentState.validate(),
              validator: (input) => KeyWorkModel.validator(input, widget.e as DataInputModel),
              onSaved: (input) => KeyWorkModel.savedDataModel(input, DataParams.data.indexOf(widget.e), widget.e, _controller),
              onFieldSubmitted: (input) => KeyWorkModel.submitted(input, _productKey),
            ),
          ) : Text(widget.e.toString()),
        ),
        (widget.e is DataInputModel) ? Text((widget.e as DataInputModel).measurement) : Text(''),
      ],
    );
  }
}
