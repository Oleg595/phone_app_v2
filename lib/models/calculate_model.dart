import 'dart:core';
import 'dart:math';

import 'package:phone_app_v2/models/data_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

class CalculateModel{
  static double CKD(){
    Male male = DataParams.data[7].value as Male;
    double creatinin = DataParams.data[5].value as double;
    double age = DataParams.data[6].value as double;

    if((creatinin < 0) || (age < 0)){
      return DataParams.defaultDoubleValue;
    }

    if(male == Male.Men){
      double d =  141 * pow(creatinin / 79.6, -1.209) * pow(0.993, age);
      return double.parse(d.toStringAsFixed(2));
    }

    if(male == Male.Women){
      double d = 144 * pow(creatinin / 61.9, -1.209) * pow(0.993, age);
      return double.parse(d.toStringAsFixed(2));
    }

    return DataParams.defaultDoubleValue;
  }

  static double pointLDR(){
    double data = DataParams.data[0].value;
    int level = 0;

    if(data <= 220){
      level = 1;
    }
    if((data > 220) && (data < 600)){
      level = ((data - (data % 100))  ~/ 100);
    }
    if(data >= 600){
      level = 6;
    }

    return level * 0.0208;
  }

  static double pointProtein(){
    double data = DataParams.data[1].value;
    int level = 0;

    if(data < 30){
      level = 1;
    }
    if((data >= 30) && (data < 45)){
      level = 2;
    }
    if(level >= 45){
      level = 3;
    }

    return level * 0.0464;
  }

  static double pointLymphocytes(){
    double data = DataParams.data[2].value;
    int level = 0;

    if(data > 3.18){
      level = 1;
    }
    if((data <= 3.18) && (data >= 2)){
      level = 2;
    }
    if((data < 2) && (data > 1.5)){
      level = 3;
    }
    if((data < 1.5) && (data >= 1.3)){
      level = 4;
    }
    if((data < 1.3) && (data >= 1)){
      level = 5;
    }
    if((data < 1) && (data >= 0.7)){
      level = 6;
    }
    if((data < 0.7) && (data >= 0.5)){
      level = 7;
    }
    if(data < 0.5){
      level = 8;
    }

    return level * 0.02025;
  }

  static double pointAST(){
    double data = DataParams.data[3].value;
    int level = 0;

    if(data < 200){
      level = ((data - (data % 40)) ~/ 40) + 1;
    }
    else{
      level = 6;
    }

    return level * 0.0302;
  }

  static double pointAPTV(){
    double data = DataParams.data[4].value;
    int level = 0;

    if(data <= 35){
      level = 1;
    }
    if((data > 35) && (data < 50)){
      level = 2;
    }
    if(data >= 50){
      level = 3;
    }

    return level * 0.0644;
  }

  static double pointSKF(){
    double data = DataParams.resultData.value;
    int level = 0;

    if(data >= 90){
      level = 1;
    }
    if((data < 90) && (data >= 60)){
      level = 2;
    }
    if((data < 60) && (data >= 30)){
      level = 3;
    }
    if((data < 30) && (data >= 15)){
      level = 4;
    }
    if(data < 15){
      level = 5;
    }

    return level * 0.04008;
  }

  static double sumPoints(){
    if(!DataParams.canGetResults()){
      return DataParams.defaultDoubleValue;
    }

    return pointLDR() + pointAST() + pointAPTV() + pointLymphocytes() + pointProtein() + pointSKF();
  }

  static String hardCVI(){
    double sum = sumPoints();
    if(sum < 0){
      return null;
    }

    if(sum < 0.35){
      DataParams.resultColor = AppColors.lowLevel;
      DataParams.fontResultColor = AppColors.defaultScreenColor;
      return 'Низкий риск - динамическое наблюдение, контроль анализов';
    }
    if(sum < 0.55){
      DataParams.resultColor = AppColors.midLevel;
      DataParams.fontResultColor = AppColors.textColor;
      return 'Высокий риск - рассматривается вопрос о назначении препаратов упреждающей противовоспалительной'
          ' терапии COVID-19 у взрослых, рекомендована терапия прямыми антикоагулянтами';
    }

    DataParams.resultColor = AppColors.highLevel;
    DataParams.fontResultColor = AppColors.defaultScreenColor;
    return 'Крайне высокий риск - необходима консультация врача отделения интенсивной терапии для оценки витальных'
        ' функций и решения вопроса о маршрутизации пациента';
  }
}
