import 'package:phone_app_v2/models/indicator_model.dart';
import 'package:phone_app_v2/shared/data_params.dart';
import 'package:xml/xml.dart';

import 'package:flutter/cupertino.dart';

class ParseIndicatorsXML{
  static Future<Null> fillIndicatorsModel(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("data/indicators.xml");
    var xmlFile = XmlDocument.parse(data);
    parseIndicatorsData(xmlFile);
    return null;
  }

  static Null parseIndicatorsData(XmlDocument xml){
    var modules = xml.findAllElements('indicator');

    for(var module in modules){
      IndicatorModel model = IndicatorModel(module.getAttribute('name'));
      model.description = module.firstElementChild.text;
      DataParams.setIndicatorParam(model);
    }

    return null;
  }
}
