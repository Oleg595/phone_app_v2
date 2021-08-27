import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/parse_indicators.xml.dart';
import 'package:phone_app_v2/shared/data_params.dart';

import 'models/parse_help_xml.dart';

class MedicineApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ParseHelpXML.fillHelpModules(context);
    ParseIndicatorsXML.fillIndicatorsModel(context);
    return MaterialApp(
      home: DataParams.menuScreen,
    );
  }
}
