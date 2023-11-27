import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mc_applicaton/home/model/visitors_model.dart';

class GetvisitorsData extends ChangeNotifier{
  static const String getvisitor = 'visitor';

TextEditingController firstNameController=TextEditingController();
TextEditingController lastnameController=TextEditingController();


   Future<Box<Visitors>> openBox() async {
    return await Hive.box<Visitors>(getvisitor);
  }

  Future<void> addNote(Visitors data) async {
    final box = await openBox();
    int key = await box.add(data);
    data.key = key;
    box.put(key, data);
    print(data);
    notifyListeners();
  }

Future<List<Visitors>> getNotes() async {
    final box = await openBox();
    return box.values.toList();
  }

}