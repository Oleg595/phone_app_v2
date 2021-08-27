import 'package:flutter/cupertino.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

import 'data_input_model.dart';
import 'data_model.dart';

class KeyWorkModel{
  static String inplace(String input){
    return input.replaceFirst(',', '.');
  }

  static String validator(String input, DataInputModel e){
    if(!e.limitations(input)){
      e.value = DataParams.defaultData[DataParams.data.indexOf(e)].value;
      return TextConstants.invalidData;
    }
    return null;
  }

  static void saved(String input, int number){
    input = inplace(input);
    DataParams.data[number].value = double.parse(input);
  }

  static void savedDataModel(String input, int number, DataModel e, TextEditingController controller){
    saved(input, number);
    e.value = DataParams.data[number].value;
    controller.text = e.toString();
  }

  static void changed(String input, GlobalKey<FormState> productKey){
    input = inplace(input);
    if (productKey.currentState.validate()) {
      productKey.currentState.save();
    }
  }

  static void submitted(String input, GlobalKey<FormState> productKey){
    input = inplace(input);
    if (productKey.currentState.validate()) {
      productKey.currentState.save();
      DataParams.updateScreens();
    }
  }
}
