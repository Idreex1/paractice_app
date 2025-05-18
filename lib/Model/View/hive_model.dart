
import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String discription;

  HiveModel(this.title, this.discription);

}