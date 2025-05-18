


import 'package:hive_flutter/hive_flutter.dart';
import 'package:paractice_app1/Model/View/hive_model.dart';

class BoxesScreen {
   static Box<HiveModel> getData() => Hive.box<HiveModel>('notes');
}