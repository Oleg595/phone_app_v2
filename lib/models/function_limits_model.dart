import 'package:phone_app_v2/models/key_work_model.dart';

class FunctionLimitsModel{
  static bool LDR(String str){
    try{
      double num = double.parse(KeyWorkModel.inplace(str));
      if((num < 100) || (num > 1000)){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }

  static bool Protein(String str){
    try{
      double num = double.parse(KeyWorkModel.inplace(str));
      if(num > 500){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }

  static bool Limphosites(String str){
    try{
      str = KeyWorkModel.inplace(str);
      List<String> split = str.split('.');
      if(split.last.length != 2){
        return false;
      }
      double num = double.parse(str);
      if(num > 10){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }

  static bool AST(String str){
    try{
      double num = double.parse(KeyWorkModel.inplace(str));
      if((num < 10) || (num > 500)){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }

  static bool APTV(String str){
    try{
      double num = double.parse(KeyWorkModel.inplace(str));
      if((num < 10) || (num > 200)){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }

  static bool Creatinin(String str){
    try{
      double num = double.parse(KeyWorkModel.inplace(str));
      if((num < 50) || (num > 1000)){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }

  static bool Age(String str){
    try{
      int num = int.parse(KeyWorkModel.inplace(str));
      if((num < 18) || (num > 100)){
        return false;
      }
      return true;
    }
    catch(exc){
      return false;
    }
  }
}
