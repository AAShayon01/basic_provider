import 'package:flutter/cupertino.dart';
import '../model/Mymodel.dart';
class WebSeriesProvider with ChangeNotifier{
  final List<WebSeries> _webSeries=webseries;
  List<WebSeries> get listWebseries=>_webSeries;
  final List<WebSeries> _mylist=[];
  List<WebSeries> get myList=>_mylist;
  void addtoList(WebSeries webSeries){
    _mylist.add(webSeries);
    notifyListeners();
  }
  void removeFromList(WebSeries webSeries){
    _mylist.remove(webSeries);
    notifyListeners();
  }
}