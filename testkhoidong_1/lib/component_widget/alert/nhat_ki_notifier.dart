// import 'dart:collection';
//
// import 'package:flutter/cupertino.dart';
//
// import '../../model/nhat_ki.dart';
//
// class NhatkiNotifier with ChangeNotifier{
//   List<Nhatki> _nhatkiList= [];
//   Nhatki _currentNhatki;
//   UnmodifiableListView<Nhatki> get nhatkiList => UnmodifiableListView((_nhatkiList));
//   Nhatki get currentNhatki => _currentNhatki;
//   //
//   set nhatkiList(List<Nhatki> nhatkiList){
//     _nhatkiList= nhatkiList;
//     notifyListeners();
//   }
//   //
//   set currentNhatki(Nhatki currentNhatki){
//     _currentNhatki= currentNhatki;
//     notifyListeners();
//   }
// }