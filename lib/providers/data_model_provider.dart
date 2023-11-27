import 'package:flutter/cupertino.dart';

import '../model/data_model.dart';

class DataModelProvider with ChangeNotifier{
  List<DataModel> datalist=[];
  void getDataModel(List<DataModel> datalist){
 this.datalist=datalist;
 notifyListeners();
  }
}