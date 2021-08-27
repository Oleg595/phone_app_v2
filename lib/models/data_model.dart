import 'package:phone_app_v2/shared/app_decorations.dart';

class DataModel<T> {
  DataModel(this.indicator, this.value);

  String toString(){
    if(value is int){
      int data = value as int;

      if(data >= 0){
        return data.toString();
      }
      else{
        return TextConstants.none;
      }
    }

    if(value is double){
      double data = value as double;

      if(data >= 0){
        return data.toString();
      }
      else{
        return TextConstants.none;
      }
    }

    if(value is Male){
      Male data = value as Male;
      if(data != Male.Non){
        return data.name;
      }
      else{
        return TextConstants.none;
      }
    }

    if(value is String){
      return value as String;
    }

    return TextConstants.none;
  }

  bool isNumberType(){
    if(value is num){
      return true;
    }
    return false;
  }

  String indicator;
  T value;
}

enum Male { Non, Men, Women }

extension MaleExtension on Male {
  String get name {
    switch (this) {
      case Male.Men:
        return TextConstants.maleMen;
      case Male.Women:
        return TextConstants.maleWomen;
      default:
        return TextConstants.none;
    }
  }
}
