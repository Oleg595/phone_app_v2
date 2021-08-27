import 'package:phone_app_v2/shared/data_params.dart';
import 'package:xml/xml.dart';

import 'package:flutter/cupertino.dart';

import 'help_data_model.dart';

class ParseHelpXML {
  static Future<Null> fillHelpModules(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("data/help.xml");
    var xmlFile = XmlDocument.parse(data);
    addHelpModules(xmlFile);
    return null;
  }

  static Null addHelpModules(XmlDocument xml) {
    var modules = xml.findAllElements('help');

    for (var module in modules) {
      HelpData aboutModule = HelpData(module.getAttribute('name'), module.firstElementChild.text);
      List<HelpData> data = [];
      var elements = module.findAllElements('button');
      for (var el in elements) {
        data.add(HelpData(el.getAttribute('name'), el.text));
      }
      DataParams.setHelpParams(module.getAttribute('name'), aboutModule, data);
    }

    return null;
  }
}
