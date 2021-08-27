import 'data_model.dart';

class DataInputModel extends DataModel<num>{
  final Function limitations;
  final String measurement;

  DataInputModel(String indicator, num value, this.limitations, this.measurement) : super(indicator, value);
}