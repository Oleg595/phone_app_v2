class HelpData{
  final String nameObject;
  final String describeObject;

  HelpData(this.nameObject, this.describeObject);
}

class HelpDataModel{
  final String nameModule;
  HelpData aboutModule = HelpData('', '');
  List<HelpData> data = [];

  HelpDataModel(this.nameModule);

  bool isName(String name){
    if(name.compareTo(nameModule) == 0){
      return true;
    }

    return false;
  }
}
