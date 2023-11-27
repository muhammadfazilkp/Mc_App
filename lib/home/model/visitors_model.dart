import 'package:hive/hive.dart';
part 'visitors_model.g.dart';

@HiveType(typeId: 0)
class Visitors extends HiveObject {
  @HiveField(0)
  late String firstname;

  @HiveField(1)
  late String lastname;

  @HiveField(2)
  int? key;

  Visitors({required this.firstname, required this.lastname, this.key});
}
