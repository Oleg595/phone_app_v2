import 'package:flutter/cupertino.dart';
import 'package:phone_app_v2/components/popup_menu_component.dart';
import 'package:phone_app_v2/components/row_params_touch_component.dart';
import 'package:phone_app_v2/models/calculate_model.dart';
import 'package:phone_app_v2/models/data_input_model.dart';
import 'package:phone_app_v2/models/data_model.dart';
import 'package:phone_app_v2/models/function_limits_model.dart';
import 'package:phone_app_v2/models/help_data_model.dart';
import 'package:phone_app_v2/models/indicator_model.dart';
import 'package:phone_app_v2/screen/data_screen.dart';
import 'package:phone_app_v2/screen/home_screen.dart';
import 'package:phone_app_v2/screen/input_screen.dart';
import 'package:phone_app_v2/screen/menu_screen.dart';
import 'package:phone_app_v2/screen/result_screen.dart';

import 'app_decorations.dart';

class DataParams {
  static final ValueNotifier<bool> toDefault = ValueNotifier<bool>(false);
  static DataScreen dataScreen = DataScreen();
  static List<GlobalKey<FormState>> keys = [
    GlobalKey(debugLabel: '__KEY1__'),
    GlobalKey(debugLabel: '__KEY2__'),
    GlobalKey(debugLabel: '__KEY3__'),
    GlobalKey(debugLabel: '__KEY4__'),
    GlobalKey(debugLabel: '__KEY5__'),
    GlobalKey(debugLabel: '__KEY6__'),
    GlobalKey(debugLabel: '__KEY7__'),
  ];
  static final List<DataModel> defaultData = [
    DataInputModel('ЛДГ', -1.0, FunctionLimitsModel.LDR, 'ед/л'),
    DataInputModel(
        'C-реактивный белок', -1.0, FunctionLimitsModel.Protein, 'мг/л'),
    DataInputModel('Лимфоциты абс.', -1.0, FunctionLimitsModel.Limphosites,
        '10\u{2079}/л'),
    DataInputModel('АСТ', -1.0, FunctionLimitsModel.AST, 'ед/л'),
    DataInputModel('АПТВ', -1.0, FunctionLimitsModel.APTV, 'сек'),
    DataInputModel(
        'Креатинин', -1.0, FunctionLimitsModel.Creatinin, 'мкмоль/л'),
    DataInputModel('Возраст', -1, FunctionLimitsModel.Age, 'лет'),
    DataModel<Male>('Пол', Male.Non),
  ];
  static List<Widget> screens = [
    InputScreen(data[0].indicator, 0, false),
    InputScreen(data[1].indicator, 1, false),
    InputScreen(data[2].indicator, 2, false),
    InputScreen(data[3].indicator, 3, false),
    InputScreen(data[4].indicator, 4, false),
    InputScreen(data[5].indicator, 5, false),
    InputScreen(data[6].indicator, 6, false),
    InputScreen(data[7].indicator, 7, true),
    HomeScreen()
  ];
  static ResultScreen resultScreen = ResultScreen();
  static List<DataModel> data = [
    DataInputModel('ЛДГ', -1.0, FunctionLimitsModel.LDR, 'ед/л'),
    DataInputModel(
        'C-реактивный белок', -1.0, FunctionLimitsModel.Protein, 'мг/л'),
    DataInputModel('Лимфоциты абс.', -1.0, FunctionLimitsModel.Limphosites,
        '10\u{2079}/л'),
    DataInputModel('АСТ', -1.0, FunctionLimitsModel.AST, 'ед/л'),
    DataInputModel('АПТВ', -1.0, FunctionLimitsModel.APTV, 'сек'),
    DataInputModel(
        'Креатинин', -1.0, FunctionLimitsModel.Creatinin, 'мкмоль/л'),
    DataInputModel('Возраст', -1, FunctionLimitsModel.Age, 'лет'),
    DataModel<Male>('Пол', Male.Non),
  ];
  static List<DataModel> results = [
    DataModel<double>('Сумма баллов:', -1.0),
    DataModel<String>('Стратификация риска тяжёлого течения КВИ:', null),
  ];
  static List<HelpDataModel> helpScreenData = [
    HelpDataModel(NameModules.menuModule),
    HelpDataModel(NameModules.homeModule),
    HelpDataModel(NameModules.indicatorsModule),
    HelpDataModel(NameModules.dataModule),
    HelpDataModel(NameModules.resultModule),
    HelpDataModel(NameModules.helpModule),
  ];
  static List<IndicatorModel> indicatorModels = [
    IndicatorModel('ЛДГ'),
    IndicatorModel('C-реактивный белок'),
    IndicatorModel('Лимфоциты абс.'),
    IndicatorModel('АСТ'),
    IndicatorModel('АПТВ'),
    IndicatorModel('Креатинин'),
    IndicatorModel('Скорость клубочковой фильтрации'),
  ];
  static MenuScreen menuScreen = MenuScreen();
  static Color resultColor = AppColors.lowLevel;
  static Color fontResultColor = AppColors.textColor;

  static double defaultDoubleValue = -1.0;
  static DataModel resultData = DataInputModel(
      'Скорость клубочковой фильтрации', -1.0, null, 'мл/мин/1,73м\u{00B2}');

  static void updateScreens() {
    toDefault.value = !toDefault.value;
    setResults();
  }

  static void toDefaultParams() {
    for (var i = 0; i < data.length; i++) {
      data[i].value = defaultData[i].value;
    }
    updateScreens();
    resultData.value = defaultDoubleValue;
    PopupMenuComponent.text.value = 'Пол';
  }

  static void setResults() {
    if ((data[7].value != Male.Non) &&
        (data[6].value >= 0) &&
        (data[5].value >= 0)) {
      resultData.value = CalculateModel.CKD();
    }
  }

  static bool canGetResults() {
    for (int i = 0; i < data.length; i++) {
      if (data[i].value == defaultData[i].value) {
        return false;
      }
    }
    return true;
  }

  static void getResults() {
    if (canGetResults()) {
      results[0].value = CalculateModel.sumPoints();
      results[1].value = CalculateModel.hardCVI();
    }
  }

  static void setHelpParams(
      String str, HelpData aboutModel, List<HelpData> model) {
    for (var el in helpScreenData) {
      if (el.nameModule.compareTo(str) == 0) {
        el.aboutModule = aboutModel;
        el.data = model;
        break;
      }
    }
  }

  static HelpDataModel getHelpParams(String str) {
    for (var el in helpScreenData) {
      if (el.nameModule.compareTo(str) == 0) {
        return el;
      }
    }
    return null;
  }

  static void setIndicatorParam(IndicatorModel model) {
    for (var el in indicatorModels) {
      if (el.name.compareTo(model.name) == 0) {
        el.description = model.description;
        return;
      }
    }
  }
}
